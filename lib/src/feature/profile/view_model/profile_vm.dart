import "dart:developer";
import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import "package:nutrition/src/data/model/user_model.dart";
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/widgets/profile_delate_diolog_widget.dart';

final profileVM = ChangeNotifierProvider((ref) => ProfileVm());

class ProfileVm extends ChangeNotifier {
  String? profileImagePath;
  File? file;
  bool isImageSelected = false;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController controllerE = TextEditingController();
  TextEditingController controllerP = TextEditingController();
  TextEditingController controllerN = TextEditingController();
  bool isCheck = false;
     String? username ;
   String? email ;
     String? password;


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


  void updateProfile() {
    var userModel = UserModel(
      name: controllerN.text,
      email: controllerE.text,
      password: controllerP.text,
    );
    if (userModel.name != null && userModel.email != null && userModel.password != null) {
      if (globalKey.currentState!.validate()) {
        globalKey.currentState!.save();
        username = userModel.name;
        email = userModel.email;
        password = userModel.password;
        notifyListeners();
        log(username!);
        log(email!);
        log(password!);
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



  Future<void> pickAndUploadImage(BuildContext context) async {
    final ImageSource? source = await _showPickerDialog(context);

    if (source == null) return;
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      final directory = await getApplicationDocumentsDirectory();
      final String savedPath = "${directory.path}/image.png";
      await file.copy(savedPath);
      await saveProfileImagePath(savedPath);
      isImageSelected = true;
      profileImagePath = savedPath;
      notifyListeners();
     await read();
      notifyListeners();
    }
  }

  Future<void> read() async {
    final savedPath = await getSavedProfileImagePath();
    if (savedPath != null && File(savedPath).existsSync()) {
      isImageSelected = true;
      profileImagePath = savedPath;
      notifyListeners();
    }
  }

  Future<void> saveProfileImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }

  Future<String?> getSavedProfileImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_image_path');
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

  Future<ImageSource?> _showPickerDialog(BuildContext context) async => await showDialog<ImageSource?>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Rasm tanlash',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Kamera'),
              onTap: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galereya'),
              onTap: () {
                Navigator.of(context).pop(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );

}


