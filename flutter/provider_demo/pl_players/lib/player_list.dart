import 'package:flutter/material.dart';
import 'package:pl_players/player_notifier.dart';
import 'package:provider/provider.dart';

class PlayerListView extends StatefulWidget {
  PlayerListView({Key key}) : super(key: key);

  @override
  _PlayerListViewState createState() => _PlayerListViewState();
}

class _PlayerListViewState extends State<PlayerListView> {
  @override
  Widget build(BuildContext context) {
    final playerNotifier = Provider.of<PlayerNotifier>(context);
    final players = playerNotifier.players;

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Text('${i + 1}'),
            title: Text('${players[i].playerName}'),
            subtitle: Text(players[i].clubName),
            trailing: Text('${players[i].position}'),
          );
        },
      ),
    );
  }
}
