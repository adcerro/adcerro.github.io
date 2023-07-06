import 'package:flutter/material.dart';

class Tools {
  Color mainColor = Colors.blue;
  Color secondColor = Colors.white;
  Tools(this.mainColor, this.secondColor);
  IconButton buttonBuilder(IconData icon, action) {
    return IconButton(onPressed: action, icon: Icon(icon));
  }

  BottomNavigationBarItem bottonButtonBuilder(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
