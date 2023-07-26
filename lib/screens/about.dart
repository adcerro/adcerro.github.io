import 'package:flutter/material.dart';
import 'package:spoticharts/tools.dart';

class About {
  late BuildContext context;
  About(this.context);
  Widget horizontalLayout(Tools tool) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        tool.textWriter(
            text: 'Meet the ✨PANES✨ team',
            size: 35,
            weight: FontWeight.bold,
            align: TextAlign.center),
        Divider(color: Theme.of(context).primaryColor),
        tool.textWriter(
            text: "Our team is conformed by 3 awesome people 💋",
            size: 25,
            weight: FontWeight.bold,
            align: TextAlign.center),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            memberLoader(
                path: 'assets/alan.jpeg',
                name: 'Alan Florez',
                description: 'Crazy guy',
                tool: tool),
            memberLoader(
                path: 'assets/katy.png',
                name: 'Katy Diaz',
                description: 'Front-End developer',
                tool: tool),
            memberLoader(
                path: 'assets/tabata.png',
                name: 'Tabata Llach',
                description: 'Back-End developer',
                tool: tool),
          ],
        )
      ],
    );
  }

  Column memberLoader(
      {required String path,
      required Tools tool,
      String name = '',
      String description = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage(path), width: 200, height: 200),
        tool.textWriter(
            text: name,
            size: 35,
            weight: FontWeight.bold,
            align: TextAlign.center),
        tool.textWriter(text: description, size: 20, align: TextAlign.center)
      ],
    );
  }

  Widget verticalLayout(Tools tool) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        tool.textWriter(
            text: 'Meet the ✨PANES✨ team',
            size: 35,
            weight: FontWeight.bold,
            align: TextAlign.center),
        Divider(color: Theme.of(context).primaryColor),
        tool.textWriter(
            text: "Our team is conformed by 3 awesome people 💋",
            size: 25,
            weight: FontWeight.bold,
            align: TextAlign.center),
        Column(
          children: [
            memberLoader(
                path: 'assets/alan.jpeg',
                name: 'Alan Florez',
                description: 'Crazy guy',
                tool: tool),
            memberLoader(
                path: 'assets/katy.png',
                name: 'Katy Diaz',
                description: 'Front-End developer',
                tool: tool),
            memberLoader(
                path: 'assets/tabata.png',
                name: 'Tabata Llach',
                description: 'Back-End developer',
                tool: tool),
          ],
        )
      ],
    );
  }
}
