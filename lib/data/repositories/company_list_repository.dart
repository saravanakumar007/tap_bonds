import 'package:injectable/injectable.dart';
import 'package:tap_bonds/services/api_client_service.dart';

@singleton
class CompanyListRepository {
  CompanyListRepository(this.apiClientService);
  final ApiClientService apiClientService;
  static String listOfBondsAPI = 'https://eol122duf9sy4de.m.pipedream.net';

  Future<List<dynamic>> fetchCompanyListData() async {
    List<dynamic> jsonData = [];
    try {
      final dynamic response = await apiClientService.dio.get(listOfBondsAPI);
      if (response.statusCode == 200) {
        jsonData = response.data['data'];
      }
    } catch (e) {
      jsonData = [];
    }
    return jsonData;
  }
}
