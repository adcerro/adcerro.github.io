import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Tools {
  String font = 'SourceSans';
  EdgeInsets pad = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  String text = '';
  late BuildContext context;
  Tools(this.context, this.font);
  IconButton buttonBuilder(IconData icon, action) {
    return IconButton(onPressed: action, icon: Icon(icon));
  }

  BottomNavigationBarItem bottonButtonBuilder(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  void setTBpadding(double num) {
    pad = EdgeInsets.fromLTRB(0, num, 0, num);
  }

  BottomNavigationBar bottomBar(
      {required List<BottomNavigationBarItem> buttons,
      int currentIndex = 0,
      required Function(int) function}) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).cardColor,
      items: buttons,
      selectedItemColor: Theme.of(context).indicatorColor,
      unselectedItemColor: Theme.of(context).primaryColor,
      currentIndex: currentIndex,
      onTap: function,
    );
  }

  Container textWriter(
      {String text = '', double size = 0, FontWeight? weight}) {
    TextStyle st = TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: Theme.of(context).primaryColor,
        fontFamily: font);
    Text tx = Text(text, style: st);
    return Container(
      padding: pad,
      child: tx,
    );
  }

  LottieBuilder lottieLoader({required String link}) {
    return Lottie.network(animate: true, link);
  }

  Container welcomeParagraph(
      {String title = '',
      double titleSize = 0,
      String text = '',
      double textSize = 0}) {
    TextStyle titleStile = TextStyle(
        fontSize: titleSize,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
        fontFamily: font);
    TextStyle textStile =
        titleStile.copyWith(fontWeight: FontWeight.normal, fontSize: textSize);

    return Container(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width / 5,
            maxWidth: MediaQuery.of(context).size.width / 1.45,
            minHeight: MediaQuery.of(context).size.height / 3),
        padding: pad,
        child: RichText(
          overflow: TextOverflow.visible,
          maxLines: 11,
          text: TextSpan(
            text: '$title\n',
            style: titleStile,
            children: <TextSpan>[
              TextSpan(text: '$text\n', style: textStile),
              TextSpan(
                text: 'Our DataFrame >',
                style: textStile.copyWith(
                    color: Colors.blue, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = _launchDBURL,
              )
            ],
          ),
        ));
  }

  _launchDBURL() async {
    Uri url =
        Uri.parse('https://www.kaggle.com/datasets/dhruvildave/spotify-charts');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
