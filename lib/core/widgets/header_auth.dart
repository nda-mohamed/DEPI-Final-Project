import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color/app_color.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 100, child: Image.asset(image)),

        SizedBox(height: 16),

        Text(
          title,
          style: GoogleFonts.bricolageGrotesque(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.primarytext,
          ),
        ),

        Text(
          subTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.gray1,
          ),
        ),
      ],
    );
  }
}
