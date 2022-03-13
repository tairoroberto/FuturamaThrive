import 'package:futurama_thrive/app/core/model/questions_response.dart';
import 'package:futurama_thrive/app/core/services/rest_client.dart';

class QuizRepository {
  final RestClient api;

  QuizRepository(this.api);

  Future<QuestionsResponse> getInfos() async {
    return api.getQuestions();
  }
}
