import 'package:flutter/material.dart';
import 'package:spoticharts/tools.dart';

class Compare {
  late BuildContext context;
  Compare(this.context);

  Widget horizontalLayout(Tools tool) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          title: Row(children: [
            TextButton(
                onPressed: () => {print('pressed1')},
                child: Text('Query🧾'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor)),
            TextButton(
                onPressed: () => {print('pressed2')},
                child: Text('Current⏲'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor)),
            TextButton(
                onPressed: () => {print('pressed3')},
                child: Text('👩‍🎤Top artists👨‍🎤'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor)),
            TextButton(
                onPressed: () => {print('pressed4')},
                child: Text('Top songs 🎵🔥'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor))
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
              [IconButton(onPressed: () => {}, icon: Icon(Icons.abc))]),
        )
      ],
    );
  }

  Widget verticalLayout(Tools tool) {
    return CustomScrollView();
  }
}
