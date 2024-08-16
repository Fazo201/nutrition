import "package:flutter/material.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

class ProfilePopappWidget extends StatelessWidget {
  const ProfilePopappWidget({super.key});

  @override
  Widget build(BuildContext context) => PopupMenuButton(
      color: Colors.white,
      itemBuilder: (context) => [
         PopupMenuItem(
          // onTap: () => controller.pickAndUploadImage(context),
          child: Text(context.localized.change_the_picture),
        ),
      ],
    );
}
