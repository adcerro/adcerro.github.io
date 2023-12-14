import 'package:flutter/material.dart';
import 'package:spoticharts/screens/about.dart';
import 'package:spoticharts/screens/compare.dart';
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

  BottomNavigationBarItem bottonButtonBuilder(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
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

  NavigationRailDestination navButtonBuilder(IconData icon, String label) {
    return NavigationRailDestination(icon: Icon(icon), label: Text(label));
  }

  NavigationRail navRail(
      {required List<NavigationRailDestination> buttons,
      int currentIndex = 0,
      required Function(int) function}) {
    return NavigationRail(
      backgroundColor: Theme.of(context).cardColor,
      destinations: buttons,
      selectedIndex: _selectedIndex,
      onDestinationSelected: function,
      indicatorColor: Theme.of(context).primaryColor,
      selectedIconTheme: IconThemeData(color: Theme.of(context).indicatorColor),
      unselectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      unselectedLabelTextStyle:
          TextStyle(color: Theme.of(context).primaryColor),
      selectedLabelTextStyle:
          TextStyle(color: Theme.of(context).indicatorColor),
      labelType: NavigationRailLabelType.all,
    );
  }

  @override
  Widget build(BuildContext context) {
    Start st = const Start();
    About ab = const About();
    Compare cp = const Compare();
    if (MediaQuery.sizeOf(context).width <= 700) {
      return Scaffold(
          bottomNavigationBar: bottomBar(buttons: <BottomNavigationBarItem>[
            bottonButtonBuilder(Icons.home_filled, 'Home'),
            bottonButtonBuilder(Icons.search, 'Compare'),
            bottonButtonBuilder(Icons.mail, 'About us')
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
    } else {
      NavigationRail rail = navRail(buttons: [
        navButtonBuilder(Icons.home_filled, 'Home'),
        navButtonBuilder(Icons.search, 'Compare'),
        navButtonBuilder(Icons.mail, 'About us')
      ], function: _onItemTapped);
      return Scaffold(body: LayoutBuilder(
        builder: (context, constraints) {
          switch (_selectedIndex) {
            case 1:
              return Row(children: [rail, Expanded(child: cp)]);
            case 2:
              return Row(children: [rail, Expanded(child: ab)]);
            default:
              return Row(children: [rail, Expanded(child: st)]);
          }
        },
      ));
    }
  }
}
