import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:spoticharts/tools.dart';
import 'dart:async';
import 'package:spotify/spotify.dart';

class Compare {
  late BuildContext context;
  String accessToken = '';
  Compare(this.context);

  List<Widget> widgetFiller(Future<Iterable<PlayHistory>> iterable) {
    List<Widget> list = [];
    return list;
  }

  Widget horizontalLayout(Tools tool) {
    final credentials = SpotifyApiCredentials(
        '55d23f0684a24570bb4e3cb9b59cacbf', '77429b32ade848e19cce3769cc7e10bd');
    final grant = SpotifyApi.authorizationCodeGrant(credentials);
    final authUri = grant.getAuthorizationUrl(
      Uri.parse('https://localhost:8080'),
      scopes: [], // scopes are optional
    );
    final spotify =
        SpotifyApi.fromAuthCodeGrant(grant, 'https://localhost:8080');
    List<Widget> list = [];
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          title: Row(children: [
            TextButton(
                onPressed: () async =>
                    {list = widgetFiller(spotify.me.recentlyPlayed().all())},
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: Text('Query🧾')),
            TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: Text('Current⏲')),
            TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: Text('👩‍🎤Top artists👨‍🎤')),
            TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor),
                child: Text('Top songs 🎵🔥'))
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate(list),
        )
      ],
    );
  }

  Widget verticalLayout(Tools tool) {
    return CustomScrollView();
  }
}
