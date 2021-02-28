// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:snake/app.dart';
import 'package:snake/repositories/preferencies_repository.dart';
import 'package:snake/stores/game_store.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(Provider<GameStore>(
      create: (_) => GameStore(PreferenciesRepository()),
      child: App(),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('SCORE'), findsOneWidget);
    expect(find.text('MEILLEUR SCORE'), findsOneWidget);
  });
}
