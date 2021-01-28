import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snake/stores/game_store.dart';

import 'game_info.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameStore gameStore = Provider.of<GameStore>(context);
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Observer(
              builder: (concext) => GameInfo('Score', gameStore.score)),
          Observer(
              builder: (concext) => GameInfo('Meilleur Score', gameStore.bestScore)),
        ],
      ),
    );
  }
}
