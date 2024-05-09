import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets/icons/custom_icons.dart';
import '../../../core/styles/text_styles.dart';

class Inputs extends StatelessWidget {
  const Inputs({
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
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.height * 0.05,
          bottom: 15),
      child: SizedBox(
        height: 100,
        child: Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            // добавить тень
            color: const Color.fromRGBO(62, 63, 67, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 30.h,
                            child: TextField(
                              controller: fromController,
                              style: TextStyles.inputText,
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[а-яА-Я]")),
                              ],
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Откуда - Москва',
                                  hintStyle: TextStyles.hintText),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            String tmp;
                            tmp = fromController.text;
                            fromController.text = toController.text;
                            toController.text = tmp;
                          },
                          child: Container(
                              padding:
                                  const EdgeInsets.only(right: 22, bottom: 6),
                              child: const Icon(
                                CustomIcons.change,
                                size: 14,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                      width: 272.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 25,
                            child: TextField(
                              style: TextStyles.inputText,
                              controller: toController,
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[а-яА-Я]")),
                              ],
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  border: InputBorder.none,
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
                              padding:
                                  const EdgeInsets.only(top: 10, right: 16),
                              child: const Icon(
                                CustomIcons.close,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
