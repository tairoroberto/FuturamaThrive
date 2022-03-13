import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/model/info_response.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/modules/home/home_repository.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeController extends ChangeNotifier {
  static const int HOME = 0;
  static const int CHARACTERS = 1;
  static const int QUIZ = 2;

  final _repository = serviceLocator<HomeRepository>();

  bool _loading = false;
  bool get loading => _loading;

  String? error;

  InfoResponse _response = InfoResponse();
  InfoResponse get response => _response;

  PersistentTabController tabController =
      PersistentTabController(initialIndex: HOME);

  void setTabIndex(int position) {
    tabController.index = position;
    notifyListeners();
  }

  Future<void> getInfos() async {
    _loading = true;
    _repository.getInfos().then((response) async {
      _response = response;
    }).catchError((error) {
      if (error is DioError) {
        this.error = error.error.toString();
      }
    }).whenComplete(() {
      _loading = false;
      notifyListeners();
    });
  }
}
