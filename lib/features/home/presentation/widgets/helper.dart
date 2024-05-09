import 'package:avia/core/assets/icons/custom_icons.dart';
import 'package:avia/core/styles/text_styles.dart';
import 'package:avia/features/placeholder_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../search/presentation/body_search.dart';

class Helper extends StatelessWidget {
  const Helper(
      {super.key, required this.toController, required this.fromController});
  final TextEditingController toController;
  final TextEditingController fromController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlaceholderScreen()),
                    );
                  },
                  child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(58, 99, 59, 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        CustomIcons.route,
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 70.w,
                  child: const Text(
                    'Сложный маршрут',
                    textAlign: TextAlign.center,
                    style: TextStyles.text2white,
                  ),
                )
              ]),
          GestureDetector(
            onTap: () {
              toController.text = 'Куда угодно';
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BodySearch(
                    toController: toController,
                    fromController: fromController,
                  ),
                ),
              );
            },
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(34, 97, 188, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    CustomIcons.ball,
                    color: Colors.white,
                  )),
              SizedBox(height: 5.h),
              const SizedBox(
                width: 85,
                child: Text(
                  'Куда угодно',
                  style: TextStyles.text2white,
                ),
              )
            ]),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen()),
              );
            },
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 66, 125, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    CustomIcons.calendar,
                    color: Colors.white,
                  )),
              SizedBox(height: 5.h),
              SizedBox(
                width: 85.w,
                child: const Text(
                  'Выходные',
                  style: TextStyles.text2white,
                  textAlign: TextAlign.center,
                ),
              )
            ]),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaceholderScreen()),
              );
            },
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 94, 94, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    CustomIcons.fire,
                    color: Colors.white,
                  )),
              SizedBox(height: 5.h),
              SizedBox(
                width: 85.w,
                child: const Text(
                  'Горячие билеты',
                  textAlign: TextAlign.center,
                  style: TextStyles.text2white,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
