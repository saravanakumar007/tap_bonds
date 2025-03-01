import 'package:injectable/injectable.dart';
import 'package:tap_bonds/services/api_client_service.dart';

@singleton
class CompanyDetailRepository {
  CompanyDetailRepository(this.apiClientService);
  final ApiClientService apiClientService;
  static String detailOfBondsAPI = 'https://eo61q3zd4heiwke.m.pipedream.net';

  Future<Map<String, dynamic>> fetchCompanyDetailData() async {
    Map<String, dynamic> jsonData = {};
    try {
      final dynamic response = await apiClientService.dio.get(detailOfBondsAPI);
      if (response.statusCode == 200) {
        jsonData = response.data;
      }
    } catch (e) {
      jsonData = {};
    }
    return jsonData;
  }
}
