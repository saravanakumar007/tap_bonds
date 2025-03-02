import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tap_bonds/data/repositories/company_list_repository.dart';
import 'package:tap_bonds/services/api_client_service.dart';

class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
void main() {
  late CompanyListRepository repository;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    repository = CompanyListRepository(ApiClientService());
  });

  group('User Repository Test', () {
    test('Should return user data when API call is successful', () async {
      when(
        mockClient.get(Uri.parse('https://eol122duf9sy4de.m.pipedream.net')),
      ).thenAnswer(
        (_) async => http.Response(
          json.encode([
            {
              "logo":
                  "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
              "isin": "INE06E501754",
              "rating": "AAA",
              "company_name": "Hella Chemical Market Private Limited",
              "tags": ["Hella"],
            },
            {
              "logo":
                  "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
              "isin": "INE06E502345",
              "rating": "AAA",
              "company_name": "Hella Chemical Market Private Limited",
              "tags": ["Hella"],
            },
            {
              "logo":
                  "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
              "isin": "INE06E508653",
              "rating": "AAA",
              "company_name": "Hella Chemical Market Private Limited",
              "tags": ["Hella"],
            },
            {
              "logo":
                  "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
              "isin": "INE06E509123",
              "rating": "AA+",
              "company_name": "Infra Steel Industries Ltd.",
              "tags": ["Infra", "Steel"],
            },
          ]),
          200,
        ),
      );

      final result = await repository.fetchCompanyListData();

      expect(
        result[0]['company_name'],
        'Hella Chemical Market Private Limited',
      );
      expect(result[0]['isin'], 'INE06E501754');
    });

    test('Should throw Exception when API call is failed', () async {
      when(
        mockClient.get(Uri.parse('https://eol122duf9sy4de.m.pipedream.net')),
      ).thenAnswer((_) async => http.Response('Failed', 404));

      expect(() => repository.fetchCompanyListData(), throwsException);
    });
  });
}
