import 'package:dio/dio.dart';
import 'package:futurama_thrive/app/core/model/characters_response.dart';
import 'package:futurama_thrive/app/core/model/info_response.dart';
import 'package:futurama_thrive/app/core/model/questions_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.sampleapis.com/futurama/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('info')
  Future<InfoResponse> getInfos();

  @GET('characters')
  Future<CharactersResponse> getCharacters();

  @GET('questions')
  Future<QuestionsResponse> getQuestions();
}
