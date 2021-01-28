import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snake/app.dart';
import 'package:snake/repositories/preferencies_repository.dart';
import 'package:snake/stores/game_store.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  PreferenciesRepository preferenciesRepository = PreferenciesRepository();
  GameStore gameStore = GameStore(preferenciesRepository);
  await gameStore.initData();
  runApp(Provider(
    create: (_) => gameStore,
    child: App(),
  ));
}
