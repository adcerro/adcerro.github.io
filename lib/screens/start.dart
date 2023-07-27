import 'package:flutter/material.dart';
import 'package:spoticharts/tools.dart';

class Start {
  late BuildContext context;
  Start(this.context);
  Widget horizontalLayout(Tools tool) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        tool.textWriter(
            text: 'Hi, this is Spoticharts 👋',
            size: 25,
            weight: FontWeight.bold),
        tool.textWriter(
            text:
                "Let's give a try to our page, we have many options to explore",
            size: 35,
            weight: FontWeight.bold),
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
                child: tool.lottieLoader(
                    link:
                        "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")),
          ],
        )
      ],
    );
  }

  Widget verticalLayout(Tools tool) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        tool.textWriter(
            text: 'Hi, this is Spoticharts 👋',
            size: 25,
            weight: FontWeight.bold),
        tool.textWriter(
            text:
                "Let's give a try to our page, we have many options to explore",
            size: 35,
            weight: FontWeight.bold),
        Divider(color: Theme.of(context).primaryColor),
        tool.welcomeParagraph(
            titleSize: 25,
            title: 'What Spoticharts does',
            textSize: 20,
            text:
                'Spoticharts is a website that is customized according to your musical tastes, allows you to discover related music and offers you the possibility to compare the popularity of songs and playlists over time, giving you a more complete and enriching music experience.'),
        tool.lottieCustomLoader(
            width: 150,
            height: 150,
            link:
                "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")
      ],
    );
  }
}
