import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tools.dart';
import 'start.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const greenColor = Color.fromRGBO(12, 43, 12, 1);
    const greenColorL = Color.fromRGBO(12, 115, 0, 1);
    return MaterialApp(
      title: 'Spoticharts',
      theme: ThemeData(
          cardColor: greenColor,
          primaryColor: greenColorL,
          indicatorColor: Colors.white,
          scaffoldBackgroundColor: Colors.black,
          highlightColor: Colors.white,
          fontFamily: 'SourceSans'),
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
    Tools tool = Tools(context, 'SourceSans');
    Start st = Start(context);
    tool.setTBpadding(20);
    return Scaffold(
        bottomNavigationBar: tool.bottomBar(buttons: <BottomNavigationBarItem>[
          tool.bottonButtonBuilder(Icons.home_filled, 'Home'),
          tool.bottonButtonBuilder(Icons.search, 'Compare'),
          tool.bottonButtonBuilder(Icons.mail, 'About us')
        ], currentIndex: _selectedIndex, function: _onItemTapped),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.of(context).size.width <= 700) {
              return st.verticalLayout(tool);
            } else {
              return st.horizontalLayout(tool);
            }
          },
        ));
  }
}
