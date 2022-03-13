import 'package:futurama_thrive/app/core/model/info_response.dart';
import 'package:futurama_thrive/app/core/services/rest_client.dart';

class HomeRepository {
  final RestClient api;

  HomeRepository(this.api);

  Future<InfoResponse> getInfos() async {
    return api.getInfos();
  }
}
