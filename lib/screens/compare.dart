import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

class Compare extends StatefulWidget {
  Compare({super.key});
  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  var db;
  var logger = Logger();
  List<Widget> _widgetFiller(iterable) {
    List<Widget> list = [];
    try {
      for (var element in iterable) {
        list.add(Text(element));
      }
    } catch (error) {
      logger.w('🚨 hey! i did not get something to iterate');
    }
    return list;
  }

  void _connectingDB() async {
    if (kIsWeb) {
    } else {}
  }

  Widget _horizontalLayout() {
    _connectingDB();
    var list;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          title: Row(children: [
            TextButton(
                onPressed: () => {
                      setState(() async {
                        list = _widgetFiller(
                            db.rawquery('select top 1 from charts'));
                      })
                    },
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: const Text('Query🧾')),
            TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: const Text('Current⏲')),
            TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: const Text('👩‍🎤Top artists👨‍🎤')),
            TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: const Text('Top songs 🎵🔥'))
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return;
          }),
        )
      ],
    );
  }

  Widget _verticalLayout() {
    return Row(
      children: [
        NavigationRail(
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.list), label: Text('Query')),
            NavigationRailDestination(
                icon: Icon(Icons.watch), label: Text('Current')),
            NavigationRailDestination(
                icon: Icon(Icons.fireplace), label: Text('Top artists')),
            NavigationRailDestination(
                icon: Icon(Icons.music_note), label: Text('Top songs'))
          ],
          selectedIndex: 0,
        ),
        ListView()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 700) {
      return _verticalLayout();
    } else {
      return Expanded(child: _horizontalLayout());
    }
  }
}
