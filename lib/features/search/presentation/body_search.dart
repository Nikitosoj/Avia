import 'package:avia/features/tickets/presentation/tickets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets/icons/custom_icons.dart';
import '../../../core/styles/text_styles.dart';
import 'chip_fake.dart';
import 'direct_list.dart';
import 'time_info.dart';
import 'inputs.dart';

class BodySearch extends StatefulWidget {
  const BodySearch(
      {super.key, required this.toController, required this.fromController});
  final TextEditingController toController;
  final TextEditingController fromController;

  @override
  State<BodySearch> createState() => _BodySearchState();
}

class _BodySearchState extends State<BodySearch> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> daysOfWeek = ['пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс'];
  final List<String> months = [
    'Янв',
    'Фев',
    'Март',
    'Апр',
    'Мая',
    'Июня',
    'Июля',
    'Авг',
    'Сент',
    'Окт',
    'Ноя',
    'Дек'
  ];
  DateTime now = DateTime.now();
  DateTime? departureTime;
  bool light = true;
  DateTime? arrivalTime;
  Future<DateTime?> _selectDate(BuildContext context, DateTime time) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(time.year, time.month, time.day),
      firstDate: DateTime(time.year, time.month, time.day),
      lastDate: DateTime(2025),
    );
    return pickedDate;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Column(
            children: [
              Inputs(
                  size: size,
                  fromController: widget.fromController,
                  toController: widget.toController),
              SizedBox(
                height: 33.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () async {
                        final selectedDate =
                            await _selectDate(context, departureTime ?? now);
                        if (selectedDate != null) {
                          setState(() {
                            arrivalTime = selectedDate;
                          });
                        }
                      },
                      child: (arrivalTime != null)
                          ? TimeInfo(
                              time: arrivalTime!,
                              months: months,
                              daysOfWeek: daysOfWeek)
                          : Container(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromRGBO(47, 48, 53, 1),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  Icon(CustomIcons.plus,
                                      size: 16, color: Colors.white),
                                  SizedBox(width: 5.w),
                                  Text('обратно', style: TextStyles.chips),
                                  SizedBox(width: 10.w)
                                ],
                              ),
                            ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () async {
                        final selectedDate = await _selectDate(context, now);
                        if (selectedDate != null) {
                          setState(() {
                            departureTime = selectedDate;
                          });
                        }
                      },
                      child: TimeInfo(
                          time: departureTime ?? now,
                          months: months,
                          daysOfWeek: daysOfWeek),
                    ),
                    SizedBox(width: 8.w),
                    ChipFake(
                      name: '1,эконом',
                      icon: CustomIcons.human,
                      iconColor: Color.fromRGBO(94, 95, 97, 1),
                    ),
                    SizedBox(width: 8.w),
                    ChipFake(
                        icon: CustomIcons.filter,
                        name: 'фильтры',
                        iconColor: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              DirectList(),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(34, 97, 188, 1),
                    borderRadius: BorderRadius.circular(8)),
                width: 328.w,
                height: 42.h,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketsScreen(
                            toName: widget.toController.text,
                            time: departureTime ?? now,
                            fromName: widget.fromController.text),
                      ),
                    );
                  },
                  child: Text(
                    'Посмотреть все билеты',
                    style: TextStyles.buttonWhite,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(36, 37, 41, 1),
                    borderRadius: BorderRadius.circular(8)),
                height: 51.h,
                width: 328.w,
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.notifications,
                      color: Color.fromRGBO(34, 97, 188, 1),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                        child: Text(
                      'Подписка на цену',
                      style: TextStyles.text1,
                    )),
                    Switch(
                      value: light,
                      onChanged: (value) {
                        setState(() {
                          light = value;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyles.navBar,
        unselectedLabelStyle: TextStyles.navBar,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        unselectedItemColor: const Color.fromRGBO(159, 159, 159, 1),
        backgroundColor: const Color.fromRGBO(12, 12, 12, 1),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(12, 12, 12, 1),
            icon: Icon(CustomIcons.bottomplane),
            label: 'Авиабилеты',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(12, 12, 12, 1),
            icon: Icon(CustomIcons.hotels),
            label: 'Отели',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(12, 12, 12, 1),
            icon: Icon(CustomIcons.shorter),
            label: 'Короче',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(12, 12, 12, 1),
            icon: Icon(CustomIcons.subcribe),
            label: 'Подписки',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(12, 12, 12, 1),
            icon: Icon(CustomIcons.profile),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
