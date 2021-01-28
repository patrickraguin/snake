import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snake/stores/game_store.dart';
import 'package:snake/ui/widgets/board.dart';
import 'package:snake/ui/widgets/bottom.dart';
import 'package:snake/ui/widgets/header.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<GameStore>(context).initGame();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [Header(), Expanded(child: Board()), Bottom()],
        ),
      ),
    );
  }
}
