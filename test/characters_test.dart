import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_thrive/app/core/services/rest_client.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/modules/characters/characters_controller.dart';
import 'package:futurama_thrive/app/modules/characters/characters_view.dart';
import 'package:futurama_thrive/app/routes.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'test_utils.dart';

class MockRestClient extends Mock implements RestClient {}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late RestClient _client;

  setUp(() {
    _client = MockRestClient();
    setupServiceLocator(client: _client);
    when(() => _client.getCharacters())
        .thenAnswer((_) async => mockCharactersResponse());
  });

  Widget createScreen() => MultiProvider(
        providers: [
          ListenableProvider(
              create: (_) => serviceLocator<CharactersController>()),
        ],
        child: MaterialApp(
            title: 'Futurama Thrive Challenge',
            initialRoute: Routes.CHARACTERS,
            routes: <String, WidgetBuilder>{
              Routes.CHARACTERS: (BuildContext context) =>
                  const CharactersView(),
            }).sizerMainTest,
      );

  testWidgets('Validate characters', (WidgetTester tester) async {
    await tester.pumpWidget(createScreen());
    await tester.pump();
    expect(find.textContaining('Philip'), findsOneWidget);
  });
}
