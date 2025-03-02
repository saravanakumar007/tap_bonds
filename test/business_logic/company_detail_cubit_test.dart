import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_cubit.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_state.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/data/repositories/company_detail_repository.dart';

import '../utils/helpers.dart';

class CompanyDetailRepositoryMock extends Mock
    implements CompanyDetailRepository {}

void main() {
  late CompanyDetailRepositoryMock companyDetailRepositoryMock;

  late CompanyDetailCubit companyDetailCubit;

  setUp(() {
    companyDetailRepositoryMock = CompanyDetailRepositoryMock();
    companyDetailCubit = CompanyDetailCubit(companyDetailRepositoryMock);
  });

  final Map<String, dynamic> jsonData = DataModelFactory.getCompanyJsonData();
  CompanyDetailModel companyDetailModel =
      DataModelFactory.getCompanyDetailData();

  tearDown(() {
    companyDetailCubit.close();
  });

  test(
    'initial state of CompanyDetailCubit should be [CompanyDetailCubit.initial()]',
    () {
      expect(companyDetailCubit.state, const CompanyDetailState.initial());
    },
  );

  blocTest(
    'emit [CompanyDetailCubit.inProgress()] and [CompanyDetailCubit.success()] on calling fetchCompanyDetailData with success state',
    build: () => companyDetailCubit,
    act: (CompanyDetailCubit cubit) {
      when(
        companyDetailRepositoryMock.fetchCompanyDetailData,
      ).thenAnswer((_) async => jsonData);
      cubit.fetchCompanyDetailData();
    },
    expect:
        () => [
          const CompanyDetailState.inProgress(),
          CompanyDetailState.success(data: companyDetailModel),
        ],
    verify: (CompanyDetailCubit cubit) {
      verify(
        () => companyDetailRepositoryMock.fetchCompanyDetailData.call(),
      ).called(1);
    },
  );

  blocTest(
    'emit [CompanyDetailState.inProgress()] and [CompanyDetailState.failure()] on Exceptions in fetchCompanyDetailData',
    build: () => companyDetailCubit,
    act: (CompanyDetailCubit cubit) {
      when(
        companyDetailRepositoryMock.fetchCompanyDetailData,
      ).thenThrow('error');
      cubit.fetchCompanyDetailData();
    },
    expect:
        () => [
          const CompanyDetailState.inProgress(),
          const CompanyDetailState.failure(message: 'error'),
        ],
    verify: (CompanyDetailCubit cubit) {
      verify(
        () => companyDetailRepositoryMock.fetchCompanyDetailData.call(),
      ).called(1);
    },
  );
}
