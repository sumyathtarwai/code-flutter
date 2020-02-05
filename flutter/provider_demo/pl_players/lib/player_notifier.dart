import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:pl_players/model/player.dart';

class PlayerNotifier with ChangeNotifier {
  List<Player> _playersList = [];

  UnmodifiableListView<Player> get players =>
      UnmodifiableListView(_playersList);

  addPlayer(Player player) {
    _playersList.add(player);
    notifyListeners();
  }
}
