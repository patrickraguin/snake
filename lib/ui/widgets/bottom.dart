import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snake/entities/Direction.dart';
import 'package:snake/stores/game_store.dart';
import 'package:snake/ui/widgets/play_button.dart';

import 'game_button.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameStore gameStore = Provider.of<GameStore>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (context) => GameButton(
                  iconData: Icons.chevron_left,
                  onPressed: () => gameStore.changeDirection(Direction.left),
                  isActive: gameStore.direction == Direction.left),
            ),
            Column(
              children: [
                Observer(
                  builder: (context) => GameButton(
                      iconData: Icons.expand_less,
                      onPressed: () => gameStore.changeDirection(Direction.top),
                      isActive: gameStore.direction == Direction.top),
                ),
                SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (context) => GameButton(
                      iconData: Icons.expand_more,
                      onPressed: () => gameStore.changeDirection(Direction.bottom),
                      isActive: gameStore.direction == Direction.bottom),
                ),
              ],
            ),
            Observer(
              builder: (context) => GameButton(
                  iconData: Icons.chevron_right,
                  onPressed: () => gameStore.changeDirection(Direction.right),
                  isActive: gameStore.direction == Direction.right),
            ),
          ],
        ),
        PlayButton()
      ]),
    );
  }
}
