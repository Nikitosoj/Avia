import 'package:avia/features/search/presentation/body_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets/icons/custom_icons.dart';
import '../../../../core/styles/text_styles.dart';
import 'helper.dart';
import 'popular_item.dart';

class SearchInputs extends StatelessWidget {
  const SearchInputs({
    super.key,
    required this.size,
    required this.fromController,
    required this.toController,
  });

  final Size size;
  final TextEditingController fromController;
  final TextEditingController toController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.85,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: Container(
            width: 328.w,
            height: 96.h,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(47, 48, 53, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 14, right: 2, top: 3),
                      child: Icon(CustomIcons.plane,
                          size: 24, color: Color.fromRGBO(94, 95, 97, 1)),
                    ),
                    SizedBox(
                      width: 246.w,
                      height: 30.h,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[а-яА-Я]")),
                        ],
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: fromController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        style: TextStyles.inputText,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 18),
                            border: InputBorder.none,
                            hintText: 'Откуда - Москва',
                            hintStyle: TextStyles.hintText),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                  width: 296.w,
                ),
                Row(
                  children: [
                    Container(
                        padding:
                            const EdgeInsets.only(left: 16, top: 5, right: 2),
                        alignment: Alignment.bottomLeft,
                        child: const Icon(CustomIcons.search_1,
                            color: Colors.white, size: 16)),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: 35.h,
                        child: TextField(
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[а-яА-Я]")),
                          ],
                          style: TextStyles.inputText,
                          onEditingComplete: () {
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
                          controller: toController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(bottom: 14, left: 6),
                              hintText: 'Куда - Турция',
                              hintStyle: TextStyles.hintText),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        toController.text = '';
                      },
                      child: Container(
                          padding: const EdgeInsets.only(top: 10, right: 12),
                          child: const Icon(
                            CustomIcons.close,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Helper(
          fromController: fromController,
          toController: toController,
        ),
        SizedBox(height: 20.h),
        Container(
          width: 328.w,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(47, 48, 53, 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  toController.text = 'Стамбул';
                },
                child: const PopularItem(
                    name: 'Стамбул',
                    imgstring: 'lib/core/assets/images/istanbul.png'),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 1,
                  color: const Color.fromRGBO(62, 63, 67, 1),
                  width: 296.w),
              GestureDetector(
                onTap: () {
                  toController.text = 'Сочи';
                },
                child: const PopularItem(
                    name: 'Сочи',
                    imgstring: 'lib/core/assets/images/Sochi.png'),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 16),
                  height: 1,
                  color: const Color.fromRGBO(62, 63, 67, 1),
                  width: 296.w),
              GestureDetector(
                onTap: () {
                  toController.text = 'Пхукет';
                },
                child: const PopularItem(
                    name: 'Пхукет',
                    imgstring: 'lib/core/assets/images/Phuket.png'),
              ),
              Container(
                  height: 1,
                  margin: const EdgeInsets.only(bottom: 15, left: 16),
                  color: const Color.fromRGBO(62, 63, 67, 1),
                  width: 296.w)
            ],
          ),
        )
      ]),
    );
  }
}
