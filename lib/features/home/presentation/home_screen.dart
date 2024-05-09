import 'package:avia/core/assets/icons/custom_icons.dart';
import 'package:avia/core/styles/text_styles.dart';
import 'package:avia/features/home/presentation/widgets/body.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.from,
    super.key,
  });
  final String from;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      Body(from: widget.from),
      const Icon(
        Icons.chat,
        size: 150,
      ),
      const Icon(
        Icons.chat,
        size: 150,
      ),
      const Icon(
        Icons.chat,
        size: 150,
      ),
      const Icon(
        Icons.chat,
        size: 150,
      ),
    ];
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
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
        backgroundColor: const Color.fromRGBO(12, 12, 12, 1));
  }
}
