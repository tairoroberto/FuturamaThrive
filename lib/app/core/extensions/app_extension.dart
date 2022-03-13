import 'package:flutter/material.dart';
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
