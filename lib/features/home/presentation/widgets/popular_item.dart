import 'package:avia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key, required this.name, required this.imgstring});
  final String name;
  final String imgstring;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 5, left: 16, right: 16),
      child: Row(
        children: [
          Image.asset(imgstring, height: 40, width: 40, fit: BoxFit.cover),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyles.names,
              ),
              SizedBox(height: 5.h),
              Text('Популярное направление', style: TextStyles.text2gray),
            ],
          )
        ],
      ),
    );
  }
}
