import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snake/stores/game_store.dart';
import 'package:snake/ui/widgets/game_button.dart';

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameStore store = Provider.of<GameStore>(context);

    return Observer(
      builder: (context) => store.playing
          ? GameButton(iconData: Icons.refresh, onPressed: () => store.initGame())
          : GameButton(
              iconData: Icons.play_arrow, onPressed: () => store.start()),
    );
  }
}
