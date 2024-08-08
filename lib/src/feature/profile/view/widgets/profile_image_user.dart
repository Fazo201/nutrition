import 'package:flutter/material.dart';

class ProfileImageUser extends StatelessWidget {
  const ProfileImageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/profile_image.png')),
    );
  }
}
