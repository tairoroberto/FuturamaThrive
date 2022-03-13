import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_extension.dart';
import 'package:futurama_thrive/app/core/styles.dart';
import 'package:futurama_thrive/app/modules/characters/characters_view.dart';
import 'package:futurama_thrive/app/modules/home/about_view.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeController extends ChangeNotifier {
  static const int HOME = 0;
  static const int CHARACTERS = 1;
  static const int QUIZ = 2;

  PersistentTabController tabController =
      PersistentTabController(initialIndex: HOME);

  void setTabIndex(int position) {
    tabController.index = position;
    notifyListeners();
  }

  List<Widget> screens() {
    return [
      const AboutView(),
      const CharactersView(),
      const QuizView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      _buildTabItem(
          'Home',
          Padding(
            padding: EdgeInsets.only(right: 3.dp),
            child: const Icon(Icons.home),
          )),
      _buildTabItem('Characters', const Icon(Icons.supervisor_account_sharp)),
      _buildTabItem('Quiz ', const Icon(Icons.quiz_sharp))
    ];
  }

  PersistentBottomNavBarItem _buildTabItem(String title, Widget icon) {
    return PersistentBottomNavBarItem(
        iconSize: 24.dp,
        icon: icon,
        title: title,
        activeColorPrimary: colorPrimary,
        inactiveColorPrimary: colorTextPrimary,
        activeColorSecondary: colorPrimary,
        inactiveColorSecondary: colorTextPrimary);
  }
}
