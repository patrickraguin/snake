import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../stores/game_store.dart';

class Board extends StatelessWidget {

  Board({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height  = size.height - 140 - 110;
    double width = size.width;
    if(height < width) {
      width = height - (defaultSide * 2.5);
    }
    return SizedBox(
        width: width,
        height: height,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: defaultSide,),
          itemBuilder: _displayCase,
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
