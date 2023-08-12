import 'package:flutter/material.dart';
import 'package:spoticharts/screens/about.dart';
import 'package:spoticharts/screens/compare.dart';
import 'package:spoticharts/tools.dart';
import 'package:spoticharts/theme/master_theme.dart';
import 'package:spoticharts/screens/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spoticharts',
      theme: Mastertheme.theme(),
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
    Tools tool = Tools(context);
    Start st = const Start();
    About ab = const About();
    Compare cp = Compare();
    return Scaffold(
        bottomNavigationBar: tool.bottomBar(buttons: <BottomNavigationBarItem>[
          tool.bottonButtonBuilder(Icons.home_filled, 'Home'),
          tool.bottonButtonBuilder(Icons.search, 'Compare'),
          tool.bottonButtonBuilder(Icons.mail, 'About us')
        ], currentIndex: _selectedIndex, function: _onItemTapped),
        body: LayoutBuilder(
          builder: (context, constraints) {
            switch (_selectedIndex) {
              case 1:
                return cp;
              case 2:
                return ab;
              default:
                return st;
            }
          },
        ));
  }
}
