import 'package:flutter/material.dart';
import 'dart:async';
import 'package:spotify/spotify.dart';
import 'package:sql_conn/sql_conn.dart';

class Compare extends StatefulWidget {
  String accessToken = '';
  Compare({super.key});
  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  List<Widget> widgetFiller(Future<Iterable<PlayHistory>> iterable) {
    List<Widget> list = [];
    return list;
  }

  void _connectingDB() async {
    await SqlConn.connect(
        ip: "fprojectdb.database.windows.net",
        port: "",
        databaseName: "projectSpotify",
        username: "panes",
        password: "Codersinthehouse");
  }

  Widget _horizontalLayout() {
    _connectingDB();
    /*final credentials = SpotifyApiCredentials(
        '55d23f0684a24570bb4e3cb9b59cacbf', '77429b32ade848e19cce3769cc7e10bd');
    final grant = SpotifyApi.authorizationCodeGrant(credentials);
    final authUri = grant.getAuthorizationUrl(
      Uri.parse('https://localhost:8080'),
      scopes: [], // scopes are optional
    );
    final spotify =
        SpotifyApi.fromAuthCodeGrant(grant, 'https://localhost:8080');*/

    List<Widget> list = [];
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          title: Row(children: [
            TextButton(
                onPressed: () async => {setState(() {})},
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
          delegate: SliverChildListDelegate(list),
        )
      ],
    );
  }

  Widget _verticalLayout() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          title: Row(children: [
            TextButton(
                onPressed: () async => {},
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
          delegate: SliverChildListDelegate([]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 700) {
      return _verticalLayout();
    } else {
      return _horizontalLayout();
    }
  }
}
