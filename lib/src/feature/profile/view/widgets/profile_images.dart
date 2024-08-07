import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';

class  ImagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: 150,
                width: 315,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/all_post_image.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
               Positioned(
                left: 10,
                bottom: 10,
                child: RichText(
                  text:   TextSpan(
                    children: [
                      TextSpan(
                        text: 'Traditional spare ribs\n baked\n ',
                        style: const AppTextStyle().splashButton
                      ),
                      TextSpan(
                        text: 'By Chef John',
                        style:const AppTextStyle().searchByChef?.copyWith(color: AppColors.cD9D9D9),
                      ),
                    ]
                  ),

                ),
              ),
              Positioned(
                right: 24,
                top: 10,
                child: Container(
                  width: 37,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.cFFE1B3,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.cFFAD30,
                        size: 10,
                      ),
                      Text(
                        '5.0',
                        style: const AppTextStyle().searchByChef?.copyWith(color: AppColors.black),
                      ),

                    ],
                  ),
                ),
              ),
               Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                    SvgPicture.asset("assetName"),

                    Text(
                      '20 min',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
