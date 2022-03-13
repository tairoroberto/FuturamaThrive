import 'package:sizer/sizer.dart';

extension AppSizerExt on num {
  double get sp => ((this / 1.35) * (SizerUtil.width / 3) / 100);

  double get dp => (this / 4.1).w;
}
