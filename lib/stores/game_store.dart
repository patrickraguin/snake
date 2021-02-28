
import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:snake/constants.dart';
import 'package:snake/entities/direction.dart';
import 'package:snake/repositories/preferencies_repository.dart';


part 'game_store.g.dart';

class GameStore = _GameStore with _$GameStore;

abstract class _GameStore with Store {

  PreferenciesRepository preferenciesRepository;

  _GameStore(this.preferenciesRepository) {
    preferenciesRepository.loadScore().then((int value) {
      _updateScore(value);
    });
  }



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
  void _updateScore(int value) {
    bestScore = value;
  }

  @action
  void initGame() {
    snake = ObservableList<int>.of(<int>[(defaultSide / 2).round()]);
    for(int i=0; i<defaultMinSnake - 1; i++) {
      snake.add(snake.last + defaultSide);
    }
    food = ObservableList<int>.of(<int>[]);
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
    timer = Timer.periodic(const Duration(milliseconds: defaultSpeed), (Timer timer) => _playingRound());
  }

  @action
  void _playingRound() {
    int indexCase;
    switch (direction) {
      case Direction.left:
        indexCase = snake.last - 1;
        if (snake.last % defaultSide == 0) {
          indexCase += defaultSide;
        }
        break;
      case Direction.right:
        indexCase = snake.last + 1;
        if (indexCase % defaultSide == 0) {
          indexCase -= defaultSide;
        }
        break;
      case Direction.top:
        if (snake.last < defaultSide) {
          indexCase = defaultSide * (defaultSide - 1) + snake.last;
        } else {
          indexCase = snake.last - defaultSide;
        }

        break;
      case Direction.bottom:
        if (snake.last > defaultSide * (defaultSide - 1)) {
          indexCase = snake.last - defaultSide * (defaultSide - 1);
        } else {
          indexCase = snake.last + defaultSide;
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
      preferenciesRepository.saveScore(bestScore);
    }
  }

  @action
  void start() {
    playing = true;
    timer =
        Timer.periodic(const Duration(milliseconds: defaultSpeed), (Timer timer) => _playingRound());
  }

  void _generateFood() {
    while(food.length < defaultNbFood) {
      final int number = Random().nextInt(defaultSide * defaultSide);
      if(!food.contains(number) && !snake.contains(number))
        food.add(number);
    }
  }
}