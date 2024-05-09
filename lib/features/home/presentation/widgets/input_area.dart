import 'package:avia/core/assets/icons/custom_icons.dart';
import 'package:avia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'search_inputs.dart';

class InputArea extends StatefulWidget {
  InputArea({super.key, required this.from});
  final String from;

  @override
  State<InputArea> createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  late final TextEditingController fromController;
  late final TextEditingController toController;
  @override
  void initState() {
    fromController = TextEditingController(text: widget.from);

    toController = TextEditingController();
    super.initState();
  }

  void saveToCache(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    fromController.text = widget.from;
    return SizedBox(
      width: 328.w,
      height: 122.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(47, 48, 53, 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            width: 296.w,
            height: 90.h,
            decoration: BoxDecoration(
              // добавить тень
              color: Color.fromRGBO(62, 63, 67, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    CustomIcons.search_1,
                    color: Color.fromRGBO(12, 12, 12, 0.9),
                    size: 16,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 15.h),
                    SizedBox(
                        width: 232.w,
                        height: 30.h,
                        child: TextField(
                          controller: fromController,
                          onTapOutside: (event) {
                            saveToCache('from', fromController.text);
                            FocusScope.of(context).unfocus();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[а-яА-Я]")),
                          ],
                          style: TextStyles.inputText,
                          onEditingComplete: () {
                            saveToCache('from', fromController.text);
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Откуда - Москва',
                              hintStyle: TextStyles.hintText),
                        )),
                    Container(
                      height: 1,
                      color: Colors.black,
                      width: 232.w,
                    ),
                    Container(
                        width: 232.w,
                        height: 35.h,
                        padding: EdgeInsets.only(),
                        child: TextField(
                          onTap: () {
                            print('object');
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                isScrollControlled: true,
                                showDragHandle: true,
                                barrierColor: Colors.black,
                                backgroundColor: Color.fromRGBO(36, 37, 41, 1),
                                context: context,
                                builder: (context) {
                                  final Size size = MediaQuery.of(context).size;
                                  return SearchInputs(
                                    size: size,
                                    fromController: fromController,
                                    toController: toController,
                                  );
                                });
                          },
                          style: TextStyles.inputText,
                          controller: toController,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[а-яА-Я]")),
                          ],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Куда - Турция',
                              hintStyle: TextStyles.hintText),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
