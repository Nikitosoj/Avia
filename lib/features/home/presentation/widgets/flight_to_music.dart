import 'package:avia/core/assets/icons/custom_icons.dart';
import 'package:avia/features/home/domain/music_fly_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/text_styles.dart';

class FlightToMusic extends StatelessWidget {
  const FlightToMusic(
      {super.key, required this.myItem, required this.imageUrl});
  final MusicFlyModel myItem;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 65),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          imageUrl,
          height: 132,
          fit: BoxFit.cover,
          width: 132,
        ),
        Text(
          myItem.title,
          style: TextStyles.names,
        ),
        SizedBox(height: 5.h),
        Text(
          myItem.town,
          style: TextStyles.artist,
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            const Icon(
              CustomIcons.flyTickets,
              color: Color.fromRGBO(159, 159, 159, 1),
            ),
            Text(
              '${myItem.value}',
              style: TextStyles.artist,
            )
          ],
        )
      ]),
    );
  }
}
