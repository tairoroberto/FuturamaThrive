import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futurama_thrive/app/core/model/questions_response.dart';
import 'package:futurama_thrive/app/core/services/service_locator.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_repository.dart';

class QuizController extends ChangeNotifier {
  final _repository = serviceLocator<QuizRepository>();

  bool _loading = false;

  bool get loading => _loading;

  String? error;

  QuestionsResponse _response = QuestionsResponse();

  QuestionsResponse get response => _response;

  Question? _question = Question();

  Question? get question => _question;

  int index = 0;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int total = 0;

  Future<void> getQuestions() async {
    _loading = true;
    _repository.getQuestions().then((response) async {
      _response = response;
      index = 0;
      correctAnswer = 0;
      wrongAnswer = 0;
      _question = response.items?[index];
      index++;
    }).catchError((error) {
      if (error is DioError) {
        this.error = error.error.toString();
      }
    }).whenComplete(() {
      _loading = false;
      notifyListeners();
    });
  }

  Future<void> validateAnswer(String? userAnswer) async {
    total = wrongAnswer + correctAnswer;
    int numberOfQuestions = response.items?.length ?? 0;
    if (total < numberOfQuestions) {
      if (userAnswer == question?.correctAnswer) {
        correctAnswer++;
      } else {
        wrongAnswer++;
      }
    }

    if (index < numberOfQuestions) {
      _question = response.items?[index];
      index++;
    }

    notifyListeners();
  }
}
