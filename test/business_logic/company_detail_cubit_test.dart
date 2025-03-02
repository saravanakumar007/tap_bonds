import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_cubit.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_state.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/data/repositories/company_detail_repository.dart';

class CompanyDetailRepositoryMock extends Mock
    implements CompanyDetailRepository {}

void main() {
  late CompanyDetailRepositoryMock companyDetailRepositoryMock;

  late CompanyDetailCubit companyDetailCubit;

  setUp(() {
    companyDetailRepositoryMock = CompanyDetailRepositoryMock();
    companyDetailCubit = CompanyDetailCubit(companyDetailRepositoryMock);
  });

  final Map<String, dynamic> jsonData = jsonDecode(
    "{logo: https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B, company_name: Hella Infra Private Limited, description: Hella Infra is a construction materials platform that enhances operational efficiency by integrating technology into the construction industry's value chain., isin: INE06E507157, status: ACTIVE, pros_and_cons: {pros: [Majority GoI ownership marked with demonstrated government support and strong integration with the parent, Strategic role in providing financial assistance to meet planned outlay of IR, Strong asset quality considering entire exposure to MoR / MoR-owned entities, Healthy capitalisation profile, Diversified borrowings profile, Liquidity: Adequate], cons: [Moderate profitability metrics, High concentration risk]}, financials: {ebitda: [{month: Jan, value: 12000000}, {month: Feb, value: 13500000}, {month: Mar, value: 11800000}, {month: Apr, value: 14500000}, {month: May, value: 12800000}, {month: Jun, value: 15500000}, {month: Jul, value: 13200000}, {month: Aug, value: 14800000}, {month: Sep, value: 13700000}, {month: Oct, value: 16000000}, {month: Nov, value: 12500000}, {month: Dec, value: 14000000}], revenue: [{month: Jan, value: 25000000}, {month: Feb, value: 26500000}, {month: Mar, value: 24500000}, {month: Apr, value: 27800000}, {month: May, value: 26000000}, {month: Jun, value: 29000000}, {month: Jul, value: 27500000}, {month: Aug, value: 28500000}, {month: Sep, value: 27000000}, {month: Oct, value: 30000000}, {month: Nov, value: 25500000}, {month: Dec, value: 29500000}]}, issuer_details: {issuer_name: TRUE CREDITS PRIVATE LIMITED, type_of_issuer: Non PSU, sector: Financial Services, industry: Finance, issuer_nature: NBFC, cin: U65190HR2017PTC070653, lead_manager: -, registrar: KFIN TECHNOLOGIES PRIVATE LIMITED, debenture_trustee: IDBI Trusteeship Services Limited}}",
  );

  CompanyDetailModel companyDetailModel = CompanyDetailModel.fromJson(jsonData);
  companyDetailModel = companyDetailModel.copyWith(
    pros: jsonData['pros_and_cons']['pros'],
    cons: jsonData['pros_and_cons']['cons'],
    ebitda:
        (jsonData['financials']['ebitda'] as List<dynamic>)
            .map((e) => Financial.fromJson(e))
            .toList(),
    revenue:
        (jsonData['financials']['revenue'] as List<dynamic>)
            .map((e) => Financial.fromJson(e))
            .toList(),
    issuerDetails: IssuerDetails.fromJson(jsonData['issuer_details']),
  );

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
