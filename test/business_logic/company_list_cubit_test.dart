import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_cubit.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_state.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';
import 'package:tap_bonds/data/repositories/company_list_repository.dart';

class CompanyListRepositoryMock extends Mock implements CompanyListRepository {}

void main() {
  late CompanyListRepositoryMock companyListRepositoryMock;

  late CompanyListCubit companyListCubit;

  setUp(() {
    companyListRepositoryMock = CompanyListRepositoryMock();
    companyListCubit = CompanyListCubit(companyListRepositoryMock);
  });

  final List<dynamic> jsonData = [
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
  ];

  final List<CompanyModel> companyModelListData =
      jsonData.map((e) => CompanyModel.fromJson(e)).toList();

  tearDown(() {
    companyListCubit.close();
  });

  test(
    'initial state of CompanyListCubit should be [CompanyListCubit.initial()]',
    () {
      expect(companyListCubit.state, const CompanyListState.initial());
    },
  );

  blocTest(
    'emit [CompanyListCubit.inProgress()] and [CompanyListCubit.success()] on calling fetchCompanyListData with success state',
    build: () => companyListCubit,
    act: (CompanyListCubit cubit) {
      when(
        companyListRepositoryMock.fetchCompanyListData,
      ).thenAnswer((_) async => [jsonData]);
      cubit.fetchCompanyListData();
    },
    expect:
        () => [
          const CompanyListState.inProgress(),
          CompanyListState.success(data: companyModelListData),
        ],
    verify: (CompanyListCubit cubit) {
      verify(
        () => companyListRepositoryMock.fetchCompanyListData.call(),
      ).called(1);
    },
  );

  blocTest(
    'emit [CompanyListState.inProgress()] and [CompanyListState.failure()] on Exceptions in fetchCompanyListData',
    build: () => companyListCubit,
    act: (CompanyListCubit cubit) {
      when(companyListRepositoryMock.fetchCompanyListData).thenThrow('error');
      cubit.fetchCompanyListData();
    },
    expect:
        () => [
          const CompanyListState.inProgress(),
          const CompanyListState.failure(message: 'error'),
        ],
    verify: (CompanyListCubit cubit) {
      verify(
        () => companyListRepositoryMock.fetchCompanyListData.call(),
      ).called(1);
    },
  );
}
