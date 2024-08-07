import 'package:flutter/material.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_save_button.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_textfield_widgets.dart';

import '../../../../core/style/text_style.dart';

class ProfileTextfildWidget extends StatelessWidget {
   ProfileTextfildWidget({super.key});

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          const SizedBox(height: 57),
          Text(
            'Email',
            style: const AppTextStyle().loginEmail,
          ),
          const SizedBox(height: 5),
           ProfileTextfieldWidget(
            hintText: 'Enter Email',
          ),
          const SizedBox(height: 30),
          Text(
            'Enter Password',
            style: const AppTextStyle().loginEmail,
          ),
          const ProfileTextfieldWidget(
            hintText: 'Enter Password',
          ),
          const SizedBox(height: 20),





        ],
      ),

    );

  }
}
