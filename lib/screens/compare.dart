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
              overlayColor:
                  MaterialStateProperty.all(Theme.of(context).cardColor),
              labelColor: Theme.of(context).highlightColor,
              unselectedLabelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context).textTheme.bodySmall,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
              indicatorSize: TabBarIndicatorSize.tab,
              splashBorderRadius: BorderRadius.circular(10),
              dividerHeight: 0,
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
        const SliverFillRemaining(
          child: TabBarView(
            children: [
              Center(child: Text('Query')),
              Center(child: Text('Current')),
              Center(child: Text('Top artists')),
              Center(child: Text('Top songs')),
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
