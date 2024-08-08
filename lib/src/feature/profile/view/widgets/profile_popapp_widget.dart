import 'package:flutter/material.dart';

class ProfilePopappWidget extends StatelessWidget {
  const ProfilePopappWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
      color: Colors.white,
      itemBuilder: (context) => [
        PopupMenuItem(
          // onTap: () => controller.pickAndUploadImage(context),
          child: Text("Rasmni o'zgartirish"),
        ),
        // if(controller.profileModel!.profileImageUrl != null)
        //   PopupMenuItem(
        //     onTap: () => controller.deleteProfilerImage(context),
        //     child: const Text("Rasmni o'chirish"),
        //   ),


      ],
    );
  }
}
