import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snake/constants.dart';
import 'package:snake/stores/game_store.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 15,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2),
          itemBuilder: (BuildContext context, int index) => _displayCase(context, index),
          itemCount: Constants.cols * Constants.rows,
        ));
  }

  Widget _displayCase(BuildContext context, int index) {
    GameStore gameStore = Provider.of<GameStore>(context);
    return Observer(
      builder: (context) => Container(
        decoration: BoxDecoration(
            color: _getCaseColor(index, gameStore.snake, gameStore.food, gameStore.losing),
            border: Border.all(color: Colors.grey, width: 0.3)),
        child: Text(
          "",
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Color _getCaseColor(int index, List<int> snake, List<int> food, bool losing) {

    if (snake.contains(index)) {
      if (losing) {
        return Constants.loseColor;
      } else {
        return Constants.color;
      }
    } else if (food.contains(index)) {
      return Constants.foodColor;
    } else {
      return Colors.white;
    }
  }
}
