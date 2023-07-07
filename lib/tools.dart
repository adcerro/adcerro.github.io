import 'dart:ui';

import 'package:flutter/material.dart';

class Tools {
  late ThemeData theme;
  String font = 'SourceSans';
  double pad = 0;
  String text = '';
  Tools(this.theme, this.font);
  IconButton buttonBuilder(IconData icon, action) {
    return IconButton(onPressed: action, icon: Icon(icon));
  }

  BottomNavigationBarItem bottonButtonBuilder(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  void setTBpadding(double num) {
    pad = num;
  }

  BottomNavigationBar bottomBar(
      {required List<BottomNavigationBarItem> buttons,
      int currentIndex = 0,
      required Function(int) function}) {
    return BottomNavigationBar(
      backgroundColor: theme.cardColor,
      items: buttons,
      selectedItemColor: theme.indicatorColor,
      unselectedItemColor: theme.primaryColor,
      currentIndex: currentIndex,
      onTap: function,
    );
  }

  Container textWriter(
      {String text = '', double size = 0, FontWeight? weight}) {
    TextStyle st = TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: theme.primaryColor,
        fontFamily: font);
    Text tx = Text(text, style: st);
    return Container(
      padding: EdgeInsets.fromLTRB(0, pad, 0, pad),
      child: tx,
    );
  }

  Container paragraphWithTitle(
      {String title = '',
      double titleSize = 0,
      String text = '',
      double textSize = 0}) {
    TextStyle titleStile = TextStyle(
        fontSize: titleSize,
        fontWeight: FontWeight.bold,
        color: theme.primaryColor,
        fontFamily: font);
    TextStyle textStile =
        titleStile.copyWith(fontWeight: FontWeight.normal, fontSize: textSize);

    return Container(
        child: RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 11,
      text: TextSpan(
        text: '$title\n',
        style: titleStile,
        children: <TextSpan>[
          TextSpan(text: text, style: textStile),
        ],
      ),
    ));
    ;
  }
}
