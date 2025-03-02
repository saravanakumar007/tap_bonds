import 'package:flutter_test/flutter_test.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';

void main() {
  group('CompanyModel', () {
    test(' object created with default constructor', () {
      const companyModel = CompanyModel(
        logo:
            'https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B',
        isin: 'INE06E501754',

        rating: 'AAA',
        companyName: 'Hella Chemical Market Private Limited',
      );

      expect(companyModel.companyName, 'Hella Chemical Market Private Limited');
      expect(companyModel.isin, 'INE06E501754');
      expect(companyModel.rating, 'AAA');
      expect(
        companyModel.logo,
        'https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B',
      );
    });

    test(' object created with json', () {
      final companyModelJsonData = CompanyModel.fromJson({
        "logo":
            "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
        "isin": "INE06E501754",
        "rating": "AAA",
        "company_name": "Hella Chemical Market Private Limited",
      });

      expect(
        companyModelJsonData.companyName,
        'Hella Chemical Market Private Limited',
      );
      expect(companyModelJsonData.isin, 'INE06E501754');
      expect(companyModelJsonData.rating, 'AAA');
      expect(
        companyModelJsonData.logo,
        'https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B',
      );
    });

    test(' object to json', () {
      final json =
          const CompanyModel(
            logo:
                'https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B',
            isin: 'INE06E501754',

            rating: 'AAA',
            companyName: 'Hella Chemical Market Private Limited',
          ).toJson();

      expect(json['company_name'], 'Hella Chemical Market Private Limited');
      expect(json['isin'], 'INE06E501754');
      expect(json['rating'], 'AAA');
      expect(
        json['logo'],
        'https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B',
      );
    });
  });
}
