


import 'package:flutter/material.dart';

class RatingButton extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;
  const RatingButton({
    super.key,
    required this.label,
    required this.time,
    required this.icon,
    required this.background,
    required this.foreground,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: EdgeInsets.symmetric(vertical:14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(children: [
          Icon(icon, size:20, color: foreground),
          SizedBox(height: 4,),
          Text(label, style: TextStyle(fontSize: 13,
           fontWeight: FontWeight.w700, 
           color: foreground),),
          SizedBox(height: 2,),
          Text(time, style: TextStyle(fontSize: 10,
          
           color: foreground.withValues(alpha: 0.7)
           ),),
        ],)
      )
    );
  }
}