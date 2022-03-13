import 'package:futurama_thrive/app/core/model/characters_response.dart';
import 'package:futurama_thrive/app/core/services/rest_client.dart';

class CharactersRepository {
  final RestClient api;

  CharactersRepository(this.api);

  Future<CharactersResponse> getInfos() async {
    return api.getCharacters();
  }
}
