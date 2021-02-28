import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snake/entities/direction.dart';
import 'package:snake/stores/game_store.dart';
import 'package:snake/ui/widgets/play_button.dart';

import 'game_button.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameStore gameStore = Provider.of<GameStore>(context);
    return Container(
      height: 140,
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
          Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (BuildContext context) => GameButton(
                  iconData: Icons.chevron_left,
                  onPressed: () => gameStore.changeDirection(Direction.left),
                  isActive: gameStore.direction == Direction.left),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                  builder: (BuildContext context) => GameButton(
                      iconData: Icons.expand_less,
                      onPressed: () => gameStore.changeDirection(Direction.top),
                      isActive: gameStore.direction == Direction.top),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (BuildContext context) => GameButton(
                      iconData: Icons.expand_more,
                      onPressed: () =>
                          gameStore.changeDirection(Direction.bottom),
                      isActive: gameStore.direction == Direction.bottom),
                ),
              ],
            ),
            Observer(
              builder: (BuildContext context) => GameButton(
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
