import 'package:flutter/material.dart';
import 'package:spoticharts/tools.dart';
import 'package:lottie/lottie.dart';

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  LottieBuilder lottieLoader({required String link}) {
    return Lottie.network(animate: true, link);
  }

  LottieBuilder lottieCustomLoader(
      {required String link, double width = 0, double height = 0}) {
    return Lottie.network(animate: true, width: width, height: height, link);
  }

  Widget _horizontalLayout() {
    Tools tool = Tools(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
            style: Theme.of(context).textTheme.headlineMedium,
            'Hi, this is Spoticharts 👋'),
        Text(
            style: Theme.of(context).textTheme.headlineLarge,
            "Let's give a try to our page, we have many options to explore"),
        Divider(color: Theme.of(context).primaryColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: tool.welcomeParagraph(
                  titleSize: 25,
                  title: 'What Spoticharts does',
                  textSize: 20,
                  text:
                      'Spoticharts is a website that is customized according to your musical tastes, allows you to discover related music and offers you the possibility to compare the popularity of songs and playlists over time, giving you a more complete and enriching music experience.'),
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: lottieLoader(
                    link:
                        "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")),
          ],
        )
      ],
    );
  }

  Widget _verticalLayout() {
    Tools tool = Tools(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
            style: Theme.of(context).textTheme.headlineMedium,
            'Hi, this is Spoticharts 👋'),
        Text(
            style: Theme.of(context).textTheme.headlineLarge,
            "Let's give a try to our page, we have many options to explore"),
        Divider(color: Theme.of(context).primaryColor),
        tool.welcomeParagraph(
            titleSize: 25,
            title: 'What Spoticharts does',
            textSize: 20,
            text:
                'Spoticharts is a website that is customized according to your musical tastes, allows you to discover related music and offers you the possibility to compare the popularity of songs and playlists over time, giving you a more complete and enriching music experience.'),
        lottieCustomLoader(
            width: 150,
            height: 150,
            link:
                "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 700) {
      return _verticalLayout();
    } else {
      return _horizontalLayout();
    }
  }
}
