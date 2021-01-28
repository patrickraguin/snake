
import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:snake/entities/Direction.dart';
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
    snake = ObservableList.of(Constants.initSnake);
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
        if (snake.last % Constants.cols == 0) {
          indexCase += Constants.cols;
        }
        break;
      case Direction.right:
        indexCase = snake.last + 1;
        if (indexCase % Constants.cols == 0) {
          indexCase -= Constants.cols;
        }
        break;
      case Direction.top:
        if (snake.last < Constants.cols) {
          indexCase = Constants.cols * (Constants.rows - 1) + snake.last;
        } else {
          indexCase = snake.last - Constants.cols;
        }

        break;
      case Direction.bottom:
        if (snake.last > Constants.cols * (Constants.rows - 1)) {
          indexCase = snake.last - Constants.cols * (Constants.rows - 1);
        } else {
          indexCase = snake.last + Constants.cols;
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
      int number = Random().nextInt(Constants.cols * Constants.rows);
      if(!food.contains(number) && !snake.contains(number))
        food.add(number);
    }
  }
}