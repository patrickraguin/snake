
import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:snake/entities/direction.dart';
import 'package:snake/repositories/preferencies_repository.dart';

import '../constants.dart';

part 'game_store.g.dart';

class GameStore = _GameStore with _$GameStore;

abstract class _GameStore with Store {

  PreferenciesRepository preferenciesRepository;

  _GameStore(this.preferenciesRepository);



  @observable
  int score;

  @observable
  int bestScore;

  @observable
  ObservableList<int> snake;

  @observable
  ObservableList<int> food;

  @observable
  bool playing;

  @observable
  bool losing;

  @observable
  Direction direction;

  Timer timer;

  @action
  void changeDirection(Direction newDirection) {
    direction = newDirection;
  }

  @action
  Future<void> initData() async {
    bestScore = await this.preferenciesRepository.loadScore();
  }

  @action
  void initGame() {
    snake = ObservableList.of([(Constants.side / 2).round()]);
    for(int i=0; i<Constants.minSnake - 1; i++) {
      snake.add(snake.last + Constants.side);
    }
    food = ObservableList.of([]);
    _generateFood();
    timer?.cancel();
    playing = false;
    losing = false;
    score = 0;
    direction = Direction.bottom;
  }

  @action
  void startPlaying() {
    playing = true;
    timer = Timer.periodic(Duration(milliseconds: Constants.speed), (timer) => _playingRound());
  }

  @action
  void _playingRound() {
    int indexCase;
    switch (direction) {
      case Direction.left:
        indexCase = snake.last - 1;
        if (snake.last % Constants.side == 0) {
          indexCase += Constants.side;
        }
        break;
      case Direction.right:
        indexCase = snake.last + 1;
        if (indexCase % Constants.side == 0) {
          indexCase -= Constants.side;
        }
        break;
      case Direction.top:
        if (snake.last < Constants.side) {
          indexCase = Constants.side * (Constants.side - 1) + snake.last;
        } else {
          indexCase = snake.last - Constants.side;
        }

        break;
      case Direction.bottom:
        if (snake.last > Constants.side * (Constants.side - 1)) {
          indexCase = snake.last - Constants.side * (Constants.side - 1);
        } else {
          indexCase = snake.last + Constants.side;
        }
        break;
    }

    if (snake.contains(indexCase)) {
      _lose();
    } else {
      if(food.contains(snake.last)) {
        food.remove(snake.last);
        _generateFood();
        snake.add(indexCase);
        score++;
      } else {
        snake.removeAt(0);
        snake.add(indexCase);
      }

    }
  }

  void _lose() {
    timer?.cancel();
    losing = true;
    if(score > bestScore) {
      bestScore = score;
      this.preferenciesRepository.saveScore(bestScore);
    }
  }

  @action
  void start() {
    playing = true;
    timer =
        Timer.periodic(Duration(milliseconds: Constants.speed), (timer) => _playingRound());
  }

  void _generateFood() {
    while(food.length < Constants.nbFood) {
      int number = Random().nextInt(Constants.side * Constants.side);
      if(!food.contains(number) && !snake.contains(number))
        food.add(number);
    }
  }
}