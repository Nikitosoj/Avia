import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/text_styles.dart';

class ChipFake extends StatelessWidget {
  const ChipFake({
    super.key,
    required this.icon,
    required this.name,
    required this.iconColor,
  });
  final IconData icon;
  final String name;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(47, 48, 53, 1),
      ),
      child: Row(children: [
        SizedBox(width: 10.w),
        Icon(
          icon,
          size: 16,
          color: iconColor,
        ),
        SizedBox(width: 8.w),
        Text(name, style: TextStyles.chips),
        SizedBox(width: 10.w)
      ]),
    );
  }
}
