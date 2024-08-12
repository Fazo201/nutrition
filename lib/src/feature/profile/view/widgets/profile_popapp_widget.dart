import "package:flutter/material.dart";

class ProfilePopappWidget extends StatelessWidget {
  const ProfilePopappWidget({super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton(
      color: Colors.white,
      itemBuilder: (context) => [
        const PopupMenuItem(
          // onTap: () => controller.pickAndUploadImage(context),
          child: Text("Rasmni o'zgartirish"),
        ),
      ],
    );
}
