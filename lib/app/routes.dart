abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const CHARACTERS = _Paths.CHARACTERS;
  static const CHARACTER_DETAIL = _Paths.CHARACTER_DETAIL;
  static const QUIZ = _Paths.QUIZ;
  static const ABOUT = _Paths.ABOUT;
}

abstract class _Paths {
  static const HOME = '/home';
  static const CHARACTERS = '/characters';
  static const CHARACTER_DETAIL = '/character/detail';
  static const QUIZ = '/quiz';
  static const ABOUT = '/about';
}
