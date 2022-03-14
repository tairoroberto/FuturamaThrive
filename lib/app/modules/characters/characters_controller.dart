import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/model/characters_response.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/modules/characters/characters_repository.dart';

class CharactersController extends ChangeNotifier {
  final _repository = serviceLocator<CharactersRepository>();

  bool _loading = false;
  bool get loading => _loading;

  String? error;

  CharactersResponse _response = CharactersResponse();
  CharactersResponse get response => _response;

  Future<void> getCharacters() async {
    _loading = true;
    _repository.getCharacters().then((response) async {
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
