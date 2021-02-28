import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:snake/stores/game_store.dart';

import '../../constants.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height  = size.height - 140 - 110;
    double width = size.width;
    if(height < width) {
      width = height - (defaultSide * 2.5);
    }
    return Container(
        width: width,
        height: height,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: defaultSide,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0),
          itemBuilder: (BuildContext context, int index) =>
              _displayCase(context, index),
          itemCount: defaultSide * defaultSide,
        ));
  }

  Widget _displayCase(BuildContext context, int index) {
    final GameStore gameStore = Provider.of<GameStore>(context);
    return Observer(
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
            color: _getCaseColor(
                index, gameStore.snake, gameStore.food, gameStore.losing),
            border: Border.all(color: Colors.grey, width: 0.3)),
        child: const Text(
          '',
          style: TextStyle(fontSize: 6),
        ),
      ),
    );
  }

  Color _getCaseColor(int index, List<int> snake, List<int> food, bool losing) {
    if (snake.contains(index)) {
      if (losing) {
        return defaultLoseColor;
      } else {
        return defaultColor;
      }
    } else if (food.contains(index)) {
      return defaultFoodColor;
    } else {
      return Colors.white;
    }
  }
}
