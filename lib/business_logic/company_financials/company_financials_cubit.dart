import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tap_bonds/business_logic/company_financials/company_financials_state.dart';

@injectable
class CompanyFinancialsCubit extends Cubit<CompanyFinancialState> {
  CompanyFinancialsCubit()
    : super(
        CompanyFinancialState(
          tapType: TabType.isinAnalysisTab,
          financialChartType: FinancialChartType.ebitda,
        ),
      );

  void changeTabType(TabType currentTapType) {
    emit(state.copyWith(tapType: currentTapType));
  }

  void changeChartType(FinancialChartType financeChartType) {
    emit(state.copyWith(financialChartType: financeChartType));
  }
}
