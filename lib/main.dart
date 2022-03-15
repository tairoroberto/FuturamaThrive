import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/core/styles.dart';
import 'package:futurama_thrive/app/modules/characters/character_detail_view.dart';
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
  setupServiceLocator();
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
        ListenableProvider(create: (_) => serviceLocator<HomeController>()),
        ListenableProvider(
            create: (_) => serviceLocator<CharactersController>()),
        ListenableProvider(create: (_) => serviceLocator<QuizController>()),
      ],
      child: MaterialApp(
        title: 'Futurama Thrive Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: primaryMaterialColor,
            iconTheme: IconThemeData(color: tabBarIconColor),
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: tabBarIconColor),
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light),
                titleTextStyle: titleStyle.copyWith(color: tabAppBarColor))),
        initialRoute: Routes.HOME,
        routes: <String, WidgetBuilder>{
          Routes.HOME: (BuildContext context) => const HomeView(),
          Routes.CHARACTERS: (BuildContext context) => const CharactersView(),
          Routes.CHARACTER_DETAIL: (BuildContext context) =>
              const CharacterDetailView(),
          Routes.QUIZ: (BuildContext context) => const QuizView(),
        },
      ),
    );
  }
}
