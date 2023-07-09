import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tools.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
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

  Widget horizontalLayout(Tools tool) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              tool.welcomeParagraph(
                  titleSize: 25,
                  title: 'What Spoticharts does',
                  textSize: 20,
                  text:
                      'Spoticharts is a website that is customized according to your musical tastes, allows you to discover related music and offers you the possibility to compare the popularity of songs and playlists over time, giving you a more complete and enriching music experience.'),
              tool.lottieLoader(
                  height: 200,
                  width: 200,
                  link:
                      "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")
            ],
          )
        ],
      ),
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
        tool.lottieLoader(
            height: 150,
            width: 150,
            link:
                "https://assets2.lottiefiles.com/private_files/lf30_fjln45y5.json")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Tools tool = Tools(context, 'SourceSans');
    tool.setTBpadding(20);
    return Scaffold(
        bottomNavigationBar: tool.bottomBar(buttons: <BottomNavigationBarItem>[
          tool.bottonButtonBuilder(Icons.home_filled, 'Home'),
          tool.bottonButtonBuilder(Icons.search, 'Compare'),
          tool.bottonButtonBuilder(Icons.mail, 'About us')
        ], currentIndex: _selectedIndex, function: _onItemTapped),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? verticalLayout(tool)
              : horizontalLayout(tool);
        }));
  }
}
