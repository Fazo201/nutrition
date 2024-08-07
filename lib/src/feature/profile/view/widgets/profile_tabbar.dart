import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';

class ProfileTabbar extends StatefulWidget {
  const ProfileTabbar({super.key});

  @override
  _ProfileTabbarState createState() => _ProfileTabbarState();
}

class _ProfileTabbarState extends State<ProfileTabbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        // Har bir tabning matni
        final tabText;
        switch (index) {
          case 0:
            tabText = "Images";
            break;
          case 1:
            tabText = "Videos";
            break;
          case 2:
            tabText = "Tag";
            break;
          default:
            tabText = "";
        }

        // Tanlangan tabmi yoki yo'qligini aniqlash
        final isSelected = _selectedIndex == index;

        return InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            width: 107,
            height: 33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? AppColors.c129575 : Colors.white,
            ),
            child: Center(
              child: Text(
                tabText,
                style: AppTextStyle().loginEnter?.copyWith(
                  color: isSelected ? Colors.white : AppColors.c71B1A1,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
