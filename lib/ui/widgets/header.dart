import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../stores/game_store.dart';

import 'game_info.dart';

class Header extends StatelessWidget {

  Header({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = Provider.of<GameStore>(context);
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Observer(
              builder: (BuildContext concext) => GameInfo('Score', gameStore.score)),
          Observer(
              builder: (BuildContext concext) => GameInfo('Meilleur Score', gameStore.bestScore)),
        ],
      ),
    );
  }
}
