import "dart:io";
import "package:file_picker/file_picker.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:path_provider/path_provider.dart";
import "../view/widgets/profile_delate_diolog_widget.dart";
final profileVM = ChangeNotifierProvider((ref) => ProfileVm());


class ProfileVm extends ChangeNotifier {

  String? profileImagePath;
  File? file;
  bool isImageSelected = false;


  Future<void> pickAndUploadImage(BuildContext context) async {
    final FilePickerResult? filePickerResult = await FilePicker.platform
        .pickFiles(type: FileType.image);

    if (filePickerResult != null) {
      final PlatformFile platformFile = filePickerResult.files.first;
      final File file = File(platformFile.path!);
      final directory = await getApplicationDocumentsDirectory();
      await file.copy("${directory.path}/image.png");

      if (context.mounted) {
        profileImagePath = file.path;
        notifyListeners();
      }

    }



  }


  Future<void> read() async {

    final directory = await getApplicationDocumentsDirectory();
    await for (var event in directory.list()) {
      if (event.path.contains('image.png')) {
        isImageSelected = true;
      }
    }
    if(isImageSelected){
      profileImagePath = File("${directory.path}/image.png") as String?;
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
          }
      );
    }
  }

}

