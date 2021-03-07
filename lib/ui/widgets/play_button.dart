import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../stores/game_store.dart';
import 'game_button.dart';

class PlayButton extends StatelessWidget {

  PlayButton({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameStore store = Provider.of<GameStore>(context);

    return Observer(
      builder: (BuildContext context) => store.playing
          ? GameButton(iconData: Icons.refresh, onPressed: store.initGame)
          : GameButton(
              iconData: Icons.play_arrow, onPressed: store.start),
    );
  }
}
