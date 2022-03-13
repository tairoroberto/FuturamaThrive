// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_thrive/app/core/services/rest_client.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/modules/home/home_controller.dart';
import 'package:futurama_thrive/app/modules/home/home_view.dart';
import 'package:futurama_thrive/app/routes.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'test_utils.dart';

class MockRestClient extends Mock implements RestClient {}

Future<void> main() async {
  late RestClient _client;

  setUp(() {
    _client = MockRestClient();
    setupServiceLocator(client: _client);
    when(() => _client.getInfos()).thenAnswer((_) async => mockInfoResponse());
  });

  Widget createScreen() => MultiProvider(
        providers: [
          ListenableProvider(create: (_) => serviceLocator<HomeController>()),
        ],
        child: MaterialApp(
            title: 'Futurama Thrive Challenge',
            initialRoute: Routes.HOME,
            routes: <String, WidgetBuilder>{
              Routes.HOME: (BuildContext context) => const HomeView(),
            }).sizerMainTest,
      );

  testWidgets('Validate creators', (WidgetTester tester) async {
    await tester.pumpWidget(createScreen());
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Creators:'), findsOneWidget);
    expect(find.text('David X. Cohen'), findsOneWidget);
    expect(find.text('Matt Groening'), findsOneWidget);
    await tester.pump();
  });
}
