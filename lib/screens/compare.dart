import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
  const Compare({super.key});
  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  Widget _layout() {
    return CustomScrollView(
      clipBehavior: Clip.antiAlias,
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          title: TabBar(
              labelColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context).textTheme.bodySmall,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
              splashBorderRadius: BorderRadius.circular(10),
              tabs: const [
                Tab(
                  text: 'Query🧾',
                ),
                Tab(
                  text: 'Current⏲',
                ),
                Tab(
                  text: '👩‍🎤Top artists👨‍🎤',
                ),
                Tab(
                  text: 'Top songs 🎵🔥',
                )
              ]),
        ),
        SliverFillRemaining(
          child: TabBarView(
            children: [
              Icon(
                Icons.directions_car,
                color: Theme.of(context).primaryColor,
              ),
              Icon(Icons.directions_car, color: Theme.of(context).primaryColor),
              Icon(Icons.directions_car, color: Theme.of(context).primaryColor),
              Icon(Icons.directions_car, color: Theme.of(context).primaryColor),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: _layout(),
    );
  }
}
