import 'package:flutter/material.dart';
import 'package:pl_players/model/player.dart';
import 'package:pl_players/player_list.dart';
import 'package:provider/provider.dart';
import 'package:pl_players/player_notifier.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/pl.png',
          color: Colors.white,
        ),
        titleSpacing: 30.0,
        title: Text('Premier League'),
      ),
      body: Column(
        children: <Widget>[
          PlayerForm(),
          PlayerListView(),
        ],
      ),
    );
  }
}

class PlayerForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final playerNotifier = Provider.of<PlayerNotifier>(context, listen: false);
    final player = Player();
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Player Name', hintText: 'Virgil van Dijk'),
              validator: (val) =>
                  val.isEmpty ? 'Player Name is required' : null,
              onSaved: (val) => player.playerName = val,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Club', hintText: 'Liverpool'),
              validator: (val) => val.isEmpty ? 'Club Name is required' : null,
              onSaved: (val) => player.clubName = val,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Position', hintText: 'Defender'),
              validator: (val) => val.isEmpty ? 'Position is required' : null,
              onSaved: (val) => player.position = val,
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                if (!_formKey.currentState.validate()) return;
                // invokes each onSaved event
                _formKey.currentState.save();
                _formKey.currentState.reset();
                playerNotifier.addPlayer(player);
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
