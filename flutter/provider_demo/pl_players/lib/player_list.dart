import 'package:flutter/material.dart';
import 'package:pl_players/provider/player_notifier.dart';
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
      height: MediaQuery.of(context).size.height * 0.56,
      child: ListView.separated(
        itemCount: players.length,
        separatorBuilder: (_, i) => Divider(
          indent: 20.0,
          endIndent: 20.0,
          color: Colors.cyanAccent,
        ),
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
