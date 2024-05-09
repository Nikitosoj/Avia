import 'package:avia/core/assets/icons/custom_icons.dart';
import 'package:avia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TicketInfo extends StatelessWidget {
  const TicketInfo(
      {super.key,
      required this.name,
      required this.timeRange,
      required this.price,
      required this.color,
      required this.size});
  final String name;
  final List<String> timeRange;
  final int price;
  final Color color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    String time = timeRange.join('  ');
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: color),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text(name, style: TextStyles.chips)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${NumberFormat.decimalPattern().format(price).replaceAll(',', ' ')} ₽',
                              style: TextStyles.chipsBlue),
                          Icon(
                            CustomIcons.rightarrow,
                            size: 16,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: 257.w,
                    child: Text(
                      time,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyles.text2white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            )
          ],
        ),
        Container(
          height: 1,
          color: Color.fromRGBO(62, 63, 67, 1),
          width: 296.w,
        ),
        SizedBox(height: 15.h)
      ],
    );
  }
}
