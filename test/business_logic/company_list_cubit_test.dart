import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_cubit.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_state.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';
import 'package:tap_bonds/data/repositories/company_list_repository.dart';

import '../utils/helpers.dart';

class CompanyListRepositoryMock extends Mock implements CompanyListRepository {}

void main() {
  late CompanyListRepositoryMock companyListRepositoryMock;

  late CompanyListCubit companyListCubit;

  setUp(() {
    companyListRepositoryMock = CompanyListRepositoryMock();
    companyListCubit = CompanyListCubit(companyListRepositoryMock);
  });

  final List<CompanyModel> companyModelListData =
      DataModelFactory.getCompanyListData();

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
      ).thenAnswer((_) async => [companyModelListData]);
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
