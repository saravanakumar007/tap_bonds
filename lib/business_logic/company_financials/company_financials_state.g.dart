// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_financials_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyFinancialState _$CompanyFinancialStateFromJson(
  Map<String, dynamic> json,
) => _CompanyFinancialState(
  tapType: $enumDecode(_$TabTypeEnumMap, json['tapType']),
  financialChartType: $enumDecode(
    _$FinancialChartTypeEnumMap,
    json['financialChartType'],
  ),
);

Map<String, dynamic> _$CompanyFinancialStateToJson(
  _CompanyFinancialState instance,
) => <String, dynamic>{
  'tapType': _$TabTypeEnumMap[instance.tapType]!,
  'financialChartType':
      _$FinancialChartTypeEnumMap[instance.financialChartType]!,
};

const _$TabTypeEnumMap = {
  TabType.isinAnalysisTab: 'isinAnalysisTab',
  TabType.prosAndConsTab: 'prosAndConsTab',
};

const _$FinancialChartTypeEnumMap = {
  FinancialChartType.ebitda: 'ebitda',
  FinancialChartType.revenue: 'revenue',
};
