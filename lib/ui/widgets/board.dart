import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snake/constants.dart';
import 'package:snake/stores/game_store.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    num height  = size.height - 140 - 110;
    num width = size.width;
    if(height < width) {
      width = height - (Constants.side * 2.5);
    }
    return Container(
        width: width,
        height: height,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: Constants.side,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0),
          itemBuilder: (BuildContext context, int index) =>
              _displayCase(context, index),
          itemCount: Constants.side * Constants.side,
        ));
  }

  Widget _displayCase(BuildContext context, int index) {
    GameStore gameStore = Provider.of<GameStore>(context);
    return Observer(
      builder: (context) => Container(
        decoration: BoxDecoration(
            color: _getCaseColor(
                index, gameStore.snake, gameStore.food, gameStore.losing),
            border: Border.all(color: Colors.grey, width: 0.3)),
        child: Text(
          '',
          style: TextStyle(fontSize: 6),
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
