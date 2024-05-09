import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/text_styles.dart';

class TimeInfo extends StatelessWidget {
  const TimeInfo({
    super.key,
    required this.time,
    required this.months,
    required this.daysOfWeek,
  });

  final DateTime time;
  final List<String> months;
  final List<String> daysOfWeek;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color.fromRGBO(47, 48, 53, 1),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Text('${time.day}  ${months[time.month - 1]}',
              style: TextStyles.chips),
          Text(
            ', ${daysOfWeek[time.weekday]}',
            style: TextStyles.chipsGrey,
          ),
          SizedBox(width: 10.w)
        ],
      ),
    );
  }
}
