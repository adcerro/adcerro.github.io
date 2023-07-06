import 'package:flutter/material.dart';
import 'tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const greenColor = Color.fromRGBO(12, 115, 0, 1);
    return MaterialApp(
      title: 'Spoticharts',
      theme: ThemeData(
        primaryColor: greenColor,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Spoticharts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Tools tool = Tools(Theme.of(context).primaryColor, Colors.black);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: <BottomNavigationBarItem>[
          tool.bottonButtonBuilder(Icons.home_filled, 'Home'),
          tool.bottonButtonBuilder(Icons.search, 'Compare'),
          tool.bottonButtonBuilder(Icons.mail, 'About us')
        ],
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          RichText(
            text: const TextSpan(
              text: 'Hi, this is spoticharts',
              style: TextStyle(color: Colors.white),
              children: <TextSpan>[TextSpan(text: '👋')],
            ),
          ),
        ]),
      ),
    );
  }
}
