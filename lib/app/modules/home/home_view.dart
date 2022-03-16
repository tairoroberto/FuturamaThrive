import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/extensions/app_utils.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/core/theme/styles.dart';
import 'package:futurama_thrive/app/modules/characters/characters_view.dart';
import 'package:futurama_thrive/app/modules/home/about_view.dart';
import 'package:futurama_thrive/app/modules/home/home_controller.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator<HomeController>();
    return PersistentTabView(context,
        controller: controller.tabController,
        screens: _screens(),
        items: _navBarItems(),
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardShows: true,
        popActionScreens: PopActionScreensType.all,
        onWillPop: (context) async => false,
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple);
  }

  List<Widget> _screens() {
    return [
      const AboutView(),
      const CharactersView(),
      const QuizView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
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
