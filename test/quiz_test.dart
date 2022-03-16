import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_thrive/app/core/services/rest_client.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_controller.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_view.dart';
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
    when(() => _client.getQuestions())
        .thenAnswer((_) async => mockQuestionsResponse());
  });

  tearDown(() {
    serviceLocator.reset();
  });

  Widget createScreen() => MultiProvider(
        providers: [
          ListenableProvider(create: (_) => serviceLocator<QuizController>()),
        ],
        child: MaterialApp(
            title: 'Futurama Thrive Challenge',
            initialRoute: Routes.QUIZ,
            routes: <String, WidgetBuilder>{
              Routes.QUIZ: (BuildContext context) => const QuizView(),
            }).sizerMainTest,
      );

  group('Quiz view', () {
    testWidgets('Validate if quiz question is correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(createScreen());
      await tester.pump();
      await tester.tap(find.text('Philip'));
      await tester.pump();
      expect(find.textContaining('You have answered 1 of 3 correctly'),
          findsOneWidget);
      await tester.pump();
    });

    testWidgets('Validate if quiz question is wrong',
        (WidgetTester tester) async {
      await tester.pumpWidget(createScreen());
      await tester.pump();
      await tester.tap(find.text('Fred'));
      await tester.pump();
      expect(find.textContaining('You have answered 0 of 3 correctly'),
          findsOneWidget);
      await tester.pump();
    });

    testWidgets('Validate if quiz question is correct get next question',
        (WidgetTester tester) async {
      await tester.pumpWidget(createScreen());
      await tester.pump();
      await tester.tap(find.text('Philip'));
      await tester.pump();
      expect(
          find.textContaining(
              "In 'Benders Big Score' what ailen species scam the earth?"),
          findsOneWidget);
      await tester.pump();
    });
  });
}
