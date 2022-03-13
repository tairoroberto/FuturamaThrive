import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/styles.dart';
import 'package:futurama_thrive/app/modules/characters/characters_controller.dart';
import 'package:futurama_thrive/app/modules/characters/characters_view.dart';
import 'package:futurama_thrive/app/modules/home/home_controller.dart';
import 'package:futurama_thrive/app/modules/home/home_view.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_controller.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_view.dart';
import 'package:futurama_thrive/app/routes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return const FuturamaThriveApp();
  }));
}

class FuturamaThriveApp extends StatelessWidget {
  const FuturamaThriveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => HomeController()),
        ListenableProvider(create: (_) => CharactersController()),
        ListenableProvider(create: (_) => QuizController()),
      ],
      child: MaterialApp(
        title: 'Futurama Thrive Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primaryMaterialColor,
        ),
        home: const HomeView(),
        routes: <String, WidgetBuilder>{
          Routes.HOME: (BuildContext context) => const HomeView(),
          Routes.CHARACTERS: (BuildContext context) => const CharactersView(),
          Routes.QUIZ: (BuildContext context) => const QuizView(),
        },
      ),
    );
  }
}
