import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake/app.dart';
import 'package:snake/repositories/preferencies_repository.dart';
import 'package:snake/stores/game_store.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  PreferenciesRepository preferenciesRepository = PreferenciesRepository();
  GameStore gameStore = GameStore(preferenciesRepository);
  await gameStore.initData();
  runApp(Provider(
    create: (_) => gameStore,
    child: App(),
  ));
}
