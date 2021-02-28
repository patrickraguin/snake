// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on _GameStore, Store {
  final _$scoreAtom = Atom(name: '_GameStore.score');

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  final _$bestScoreAtom = Atom(name: '_GameStore.bestScore');

  @override
  int get bestScore {
    _$bestScoreAtom.reportRead();
    return super.bestScore;
  }

  @override
  set bestScore(int value) {
    _$bestScoreAtom.reportWrite(value, super.bestScore, () {
      super.bestScore = value;
    });
  }

  final _$snakeAtom = Atom(name: '_GameStore.snake');

  @override
  ObservableList<int> get snake {
    _$snakeAtom.reportRead();
    return super.snake;
  }

  @override
  set snake(ObservableList<int> value) {
    _$snakeAtom.reportWrite(value, super.snake, () {
      super.snake = value;
    });
  }

  final _$foodAtom = Atom(name: '_GameStore.food');

  @override
  ObservableList<int> get food {
    _$foodAtom.reportRead();
    return super.food;
  }

  @override
  set food(ObservableList<int> value) {
    _$foodAtom.reportWrite(value, super.food, () {
      super.food = value;
    });
  }

  final _$playingAtom = Atom(name: '_GameStore.playing');

  @override
  bool get playing {
    _$playingAtom.reportRead();
    return super.playing;
  }

  @override
  set playing(bool value) {
    _$playingAtom.reportWrite(value, super.playing, () {
      super.playing = value;
    });
  }

  final _$losingAtom = Atom(name: '_GameStore.losing');

  @override
  bool get losing {
    _$losingAtom.reportRead();
    return super.losing;
  }

  @override
  set losing(bool value) {
    _$losingAtom.reportWrite(value, super.losing, () {
      super.losing = value;
    });
  }

  final _$directionAtom = Atom(name: '_GameStore.direction');

  @override
  Direction get direction {
    _$directionAtom.reportRead();
    return super.direction;
  }

  @override
  set direction(Direction value) {
    _$directionAtom.reportWrite(value, super.direction, () {
      super.direction = value;
    });
  }

  final _$_GameStoreActionController = ActionController(name: '_GameStore');

  @override
  void changeDirection(Direction newDirection) {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore.changeDirection');
    try {
      return super.changeDirection(newDirection);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateScore(int value) {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore._updateScore');
    try {
      return super._updateScore(value);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initGame() {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.initGame');
    try {
      return super.initGame();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startPlaying() {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore.startPlaying');
    try {
      return super.startPlaying();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _playingRound() {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore._playingRound');
    try {
      return super._playingRound();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void start() {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.start');
    try {
      return super.start();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
score: ${score},
bestScore: ${bestScore},
snake: ${snake},
food: ${food},
playing: ${playing},
losing: ${losing},
direction: ${direction}
    ''';
  }
}
