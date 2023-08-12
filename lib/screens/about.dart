import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Widget _horizontalLayout() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Meet the ✨PANES✨ team',
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        Divider(color: Theme.of(context).primaryColor),
        Text(
          "Our team is conformed by 3 awesome people 💋",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _memberLoader(
                path: 'assets/alan.jpeg',
                name: 'Alan Florez',
                description: 'Crazy guy'),
            _memberLoader(
                path: 'assets/katy.png',
                name: 'Katy Diaz',
                description: 'Front-End developer'),
            _memberLoader(
                path: 'assets/tabata.png',
                name: 'Tabata Llach',
                description: 'Back-End developer'),
          ],
        )
      ],
    );
  }

  Column _memberLoader(
      {required String path, String name = '', String description = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage(path), width: 200, height: 200),
        Text(
          name,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _verticalLayout() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Meet the ✨PANES✨ team',
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        Divider(color: Theme.of(context).primaryColor),
        Text(
          "Our team is conformed by 3 awesome people 💋",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            _memberLoader(
                path: 'assets/alan.jpeg',
                name: 'Alan Florez',
                description: 'Crazy guy'),
            _memberLoader(
                path: 'assets/katy.png',
                name: 'Katy Diaz',
                description: 'Front-End developer'),
            _memberLoader(
                path: 'assets/tabata.png',
                name: 'Tabata Llach',
                description: 'Back-End developer'),
          ],
        )
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
