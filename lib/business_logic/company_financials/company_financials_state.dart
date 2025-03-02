import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_financials_state.freezed.dart';
part 'company_financials_state.g.dart';

enum TabType { isinAnalysisTab, prosAndConsTab }

enum FinancialChartType { ebitda, revenue }

@freezed
abstract class CompanyFinancialState with _$CompanyFinancialState {
  const factory CompanyFinancialState({
    required TabType tapType,
    required FinancialChartType financialChartType,
  }) = _CompanyFinancialState;

  factory CompanyFinancialState.fromJson(Map<String, dynamic> json) =>
      _$CompanyFinancialStateFromJson(json);
}
