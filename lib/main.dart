import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snake/app.dart';
import 'package:snake/repositories/preferencies_repository.dart';
import 'package:snake/stores/game_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  final PreferenciesRepository preferenciesRepository =
      PreferenciesRepository();
  final GameStore gameStore = GameStore(preferenciesRepository);
  await gameStore.initData();
  runApp(Provider<GameStore>(
    create: (_) => gameStore,
    child: App(),
  ));
}
