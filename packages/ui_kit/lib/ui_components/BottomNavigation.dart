import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class BottomNavigation {
  Widget create({int initialIndex = 0, ValueChanged<int>? onIndexChanged}) {
    return _TabBar(initialIndex: initialIndex, onIndexChanged: onIndexChanged);
  }
}

class _TabBar extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int>? onIndexChanged;

  const _TabBar({
    required this.initialIndex,
    this.onIndexChanged,
  });

  @override
  State<_TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<_TabBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA0A0A0).withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, -0.5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          widget.onIndexChanged?.call(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ui.colors.accent,      // #FEE440
        unselectedItemColor: Color(0xFFB8C1CC),  // #B8C1CC
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 16/12,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 16/12,
          color: Color(0xFFB8C1CC),
        ),
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? ui.images.homeActiv(size: 32)
                : ui.images.home(size: 32),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? ui.images.katalogActiv(size: 32)
                : ui.images.katalog(size: 32),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(top: 5),
              child: _currentIndex == 2
                  ? ui.images.projectActiv(size: 24)
                  : ui.images.project(size: 24),),
            label: 'Проекты',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? ui.images.profileActiv(size: 32)
                : ui.images.profile(size: 32),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}