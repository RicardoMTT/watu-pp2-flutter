import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onChangeTab;

  const CommonBottomNavigationBar({
    Key key,
    this.currentIndex,
    this.onChangeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) => onChangeTab(index),
        items: [
          _bottomNavigationBarItem('Inicio'),
          _bottomNavigationBarItem('Mis reservas'),
          _bottomNavigationBarItem('Mi perfil')
        ]);
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String label) {
    return BottomNavigationBarItem(
      icon: Container(height: 0, child: const Icon(null)),
      label: label,
    );
  }
}
