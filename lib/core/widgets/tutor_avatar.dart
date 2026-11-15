import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';




 
class TutorAvatar extends StatelessWidget {
  const TutorAvatar({super.key, this.size = 44, this.image});

  final double size;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.mint,
        border: Border.all(color: AppColor.surface, width: size * 0.05),
        image: image == null
            ? null
            : DecorationImage(image: image!, fit: BoxFit.cover),
      ),
      child: image == null
          ? Icon(Icons.face_3_rounded,
              size: size * 0.62, color: AppColor.primary)
          : null,
    );
  }
}
