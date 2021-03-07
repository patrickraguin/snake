import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../stores/game_store.dart';
import '../widgets/board.dart';
import '../widgets/bottom.dart';
import '../widgets/header.dart';

class Home extends StatelessWidget {

  Home({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<GameStore>(context).initGame();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: <Widget>[Header(), Expanded(child: Board()), Bottom()],
        ),
      ),
    );
  }
}
