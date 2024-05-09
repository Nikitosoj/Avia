import 'package:flutter/material.dart';

import '../../../core/assets/icons/custom_icons.dart';
import '../../../core/styles/text_styles.dart';
import 'widgets/tickets_body.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen(
      {super.key,
      required this.fromName,
      required this.toName,
      required this.time});
  final String fromName;
  final String toName;
  final DateTime time;

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TicketsBody(
        fromName: widget.fromName,
        time: widget.time,
        toName: widget.toName,
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
