import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  EdgeInsets padd = const EdgeInsets.all(20);
  Column _memberLoader(
      {required String path, String name = '', String description = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage(path), width: 200, height: 200),
        Padding(
          padding: padd,
          child: Text(
            name,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: padd,
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Column _verticalLayout() {
    return Column(
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
    );
  }

  Row _horizontalLayout() {
    return Row(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padd,
      children: [
        Padding(
          padding: padd,
          child: Text(
            'Meet the ✨PANES✨ team',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(color: Theme.of(context).primaryColor),
        Padding(
          padding: padd,
          child: Text(
            "Our team is conformed by 3 awesome people 💋",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        (MediaQuery.sizeOf(context).width <= 840)
            ? _verticalLayout()
            : _horizontalLayout()
      ],
    );
  }
}
