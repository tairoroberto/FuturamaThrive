import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

extension AppSizerExt on num {
  double get sp => ((this / 1.35) * (SizerUtil.width / 3) / 100);

  double get dp => (this / 4.1).w;
}

extension WidgetExtension on BuildContext {
  void onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }
}

Future<T?> navigateTo<T>(BuildContext context, Widget page,
    {String? routeName}) {
  return pushNewScreenWithRouteSettings<T>(
    context,
    settings: RouteSettings(name: routeName),
    screen: page,
    withNavBar: true,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
