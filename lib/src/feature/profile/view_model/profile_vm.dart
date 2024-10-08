import "dart:convert";
import "dart:core";
import "dart:developer";
import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:image_picker/image_picker.dart";
import "package:l/l.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/storage/app_storage.dart";
import "package:nutrition/src/data/model/user_model.dart";
import "package:path_provider/path_provider.dart";
import "../view/widgets/profile_delate_diolog_widget.dart";
import "../view/widgets/profile_language_change_widget.dart";

final profileVM = ChangeNotifierProvider((ref) => ProfileVm());

class ProfileVm extends ChangeNotifier {
  ProfileVm() {
    readInfo(StorageKey.userModel);
    read();
    notifyListeners();
  }

  String? profileImagePath;
  File? file;
  bool isImageSelected = false;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController controllerE = TextEditingController();
  TextEditingController controllerP = TextEditingController();
  TextEditingController controllerN = TextEditingController();
  bool isCheck = false;
  String? username;
  String? email;
  String? password;
  late UserModel userModel;

  void onChanged(String? value) {
    globalKey.currentState!.validate();
    notifyListeners();
  }

  String? validator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return "Please enter your name";
    }
  }

  void check(bool? value) {
    isCheck = value ?? false;
    notifyListeners();
  }

  Future<void> readInfo(StorageKey key) async {
    final result = await AppStorage.$read(key: StorageKey.userModel);
    log(result.toString());
    if (result != null) {
      userModel = UserModel.fromJson(jsonDecode(result));
      username = userModel.name;
      email = userModel.email;
      password = replaceHalfWithAsterisk(
        userModel.password.toString(),
      );
      log(username!);
      log(email!);
      log(userModel.email!);
      notifyListeners();
    }
  }

  String replaceHalfWithAsterisk(String input) {
    final halfLength = (input.length / 2)
        .ceil(); // Matnning yarmidan boshlab belgilarni hisoblash
    final firstHalf = input.substring(0, halfLength); // Matnning birinchi yarmi
    final replacedHalf = "*" *
        (input.length - halfLength); // Ikkinchi yarmini '*' bilan almashtirish
    return firstHalf +
        replacedHalf; // Birinchi yarimni va '*'larni birlashtirish
  }

  Future<void> updateProfile() async {
    final userModel1 = UserModel(
      name: controllerN.text,
      email: controllerE.text,
      password: controllerP.text,
    );
    await AppStorage.$write(
        key: StorageKey.userModel, value: jsonEncode(userModel1.toJson()));
    notifyListeners();
    final result = await AppStorage.$read(key: StorageKey.userModel);
    log(result.toString());
    if (result != null) {
      userModel = UserModel.fromJson(jsonDecode(result));
    }
    if (userModel.name != null &&
        userModel.email != null &&
        userModel.password != null) {
      if (globalKey.currentState!.validate()) {
        globalKey.currentState!.save();
        username = userModel.name;
        email = userModel.email;
        password = replaceHalfWithAsterisk(userModel.password.toString());
        notifyListeners();
        l.e(username!);
        log(email!);
        log(password!);
        log(userModel.password!);
      }
    } else {
      if (globalKey.currentState!.validate()) {
        globalKey.currentState!.save();
        notifyListeners();
      }
    }
    notifyListeners();
    controllerN.clear();
    controllerE.clear();
    controllerP.clear();
    notifyListeners();
  }

  Future<void> read() async {
    // final savedPath = await getSavedProfileImagePath();
    // if (savedPath != null && File(savedPath).existsSync()) {
    //   isImageSelected = true;
    //   profileImagePath = savedPath;
    //   notifyListeners();
    // }

    final savedPath = await AppStorage.$read(key: StorageKey.imagePath);
    if (savedPath != null && File(savedPath).existsSync()) {
      isImageSelected = true;
      profileImagePath = savedPath;
      notifyListeners();
    }
  }

  Future<void> pickAndUploadImage(BuildContext context) async {
    final source = await _showPickerDialog(context);

    if (source == null) return;
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final directory = await getApplicationDocumentsDirectory();
      final savedPath = "${directory.path}/image.png";
      await file.copy(savedPath);
      await saveProfileImagePath(savedPath);
      isImageSelected = true;
      profileImagePath = savedPath;
      notifyListeners();
      await read();
      notifyListeners();
    }
  }

  Future<void> deleteProfilerImage(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 150));
    if (context.mounted) {
      DeleteDialog(
        context: context,
        imageUrl: "",
        delete: () async {
          final directory = await getApplicationDocumentsDirectory();
          await directory.delete(recursive: true);
          profileImagePath = null;
          file = null;
          isImageSelected = false;
          notifyListeners();
        },
      );
    }
  }

  Future<void> languageChange(BuildContext context) async {
    final selectedLanguage = await LanguagePickerDialog.show(context);
    if (selectedLanguage != null) {
      // Tanlangan til bilan biror amalni bajarish
      log("Tanlangan til: $selectedLanguage");
      // Masalan, tilni sozlamalarda saqlash yoki UI ni yangilash.
    } else {
      log("Til tanlanmadi yoki bekor qilindi.");
    }
  }

  Future<void> saveProfileImagePath(String path) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString("profile_image_path", path);
    await AppStorage.$write(key: StorageKey.imagePath, value: path);
  }

  Future<String?> getSavedProfileImagePath() async {
    // final prefs = await SharedPreferences.getInstance();
    // return prefs.getString("profile_image_path");
    final result = await AppStorage.$read(key: StorageKey.imagePath);
    return result;
  }

  Future<void> logOutAccount(BuildContext context) async {
    await AppStorage.$delete(key: StorageKey.accessToken);
    context.pushReplacement(AppRouteNames.login);
  }

  Future<ImageSource?> _showPickerDialog(BuildContext context) async =>
      showDialog<ImageSource?>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            context.localized.choose_image,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text(context.localized.camera),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(context.localized.gallery),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      );
}
