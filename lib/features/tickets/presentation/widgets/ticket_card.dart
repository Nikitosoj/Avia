import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/styles/text_styles.dart';
import '../../domain/ticket_model.dart';

class TicketCard extends StatefulWidget {
  const TicketCard({super.key, required this.myItem});
  final TicketModel myItem;

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  String calculateTimeDifference(DateTime departureTime, DateTime arrivalTime) {
    int differenceInMillis = arrivalTime.millisecondsSinceEpoch -
        departureTime.millisecondsSinceEpoch;

    double differenceInHours = differenceInMillis / (1000 * 60 * 60);

    differenceInHours = (differenceInHours * 2).roundToDouble() / 2;
    if (differenceInHours == differenceInHours.toInt().toDouble()) {
      return differenceInHours.toInt().toString();
    }
    return differenceInHours.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    String time = calculateTimeDifference(
        widget.myItem.departure.date, widget.myItem.arrival.date);
    return Container(
      padding: EdgeInsets.only(top: 5.h),
      child: Stack(
        children: [
          Container(
            width: 328.w,
            height: 117.h,
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(29, 30, 32, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                    '${NumberFormat.decimalPattern().format(widget.myItem.value).replaceAll(',', ' ')} ₽',
                    style: TextStyles.title2),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 94, 94, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${widget.myItem.departure.date.hour.toString().padLeft(2, '0')}:${widget.myItem.departure.date.minute.toString().padLeft(2, '0')} — ${widget.myItem.arrival.date.hour.toString().padLeft(2, '0')}:${widget.myItem.arrival.date.minute.toString().padLeft(2, '0')} ',
                                  style: TextStyles.chips,
                                ),
                              ],
                            ),
                            SizedBox(width: 16.w),
                            Row(
                              children: [
                                Text(
                                  '$timeч в пути',
                                  style: TextStyles.artist,
                                ),
                                SizedBox(width: 1.w),
                                (widget.myItem.hasTransfer)
                                    ? Container()
                                    : Row(
                                        children: [
                                          const Text(
                                            '/',
                                            style: TextStyles.artist,
                                          ),
                                          SizedBox(width: 1.w),
                                          const Text(
                                            'Без пересадок',
                                            style: TextStyles.artist,
                                          ),
                                        ],
                                      )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.myItem.departure.airport,
                              style: TextStyles.chipsGrey,
                            ),
                            SizedBox(width: 28.w),
                            Text(
                              widget.myItem.arrival.airport,
                              style: TextStyles.chipsGrey,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          (widget.myItem.badge != '')
              ? Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(34, 97, 188, 1)),
                  child: Text(
                    widget.myItem.badge,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
