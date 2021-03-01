import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'repositories/preferencies_repository.dart';
import 'package:snake/stores/game_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  runApp(Provider<GameStore>(
    create: (_) => GameStore(PreferenciesRepository()),
    child: App(),
  ));
}
