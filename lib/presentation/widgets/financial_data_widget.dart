import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_bonds/business_logic/company_financials/company_financials_cubit.dart';
import 'package:tap_bonds/business_logic/company_financials/company_financials_state.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/presentation/widgets/chart_widget.dart';
import 'package:tap_bonds/utils/extensions.dart';

class FinancialDataWidget extends StatelessWidget {
  const FinancialDataWidget({
    super.key,
    required this.companyFinancialState,
    required this.companyDetailModel,
  });

  final CompanyFinancialState companyFinancialState;

  final CompanyDetailModel companyDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: HexColor('#E7E5E4')),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            spreadRadius: -1,
            blurRadius: 6,
            color: HexColor('#0000000F'),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'COMPANY FINANCIALS',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: HexColor('#A3A3A3'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: HexColor('#F5F5F5'),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: HexColor('#E5E5E5')),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      spreadRadius: -1,
                      blurRadius: 6,
                      color: HexColor('#0000000F'),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        BlocProvider.of<CompanyFinancialsCubit>(
                          context,
                        ).changeChartType(FinancialChartType.ebitda);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border:
                              companyFinancialState.financialChartType ==
                                      FinancialChartType.ebitda
                                  ? Border.all(color: HexColor('#E5E5E5'))
                                  : null,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                          color:
                              companyFinancialState.financialChartType ==
                                      FinancialChartType.ebitda
                                  ? HexColor('#FFFFFF')
                                  : Colors.transparent,
                        ),
                        child: Text(
                          'EBITDA',
                          style: GoogleFonts.inter(
                            color:
                                companyFinancialState.financialChartType ==
                                        FinancialChartType.ebitda
                                    ? HexColor('#171717')
                                    : HexColor('#737373'),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        BlocProvider.of<CompanyFinancialsCubit>(
                          context,
                        ).changeChartType(FinancialChartType.revenue);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color:
                              companyFinancialState.financialChartType ==
                                      FinancialChartType.revenue
                                  ? HexColor('#FFFFFF')
                                  : Colors.transparent,
                          border:
                              companyFinancialState.financialChartType ==
                                      FinancialChartType.revenue
                                  ? Border.all(color: HexColor('#E5E5E5'))
                                  : null,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: Text(
                          'Revenue',
                          style: GoogleFonts.inter(
                            color:
                                companyFinancialState.financialChartType ==
                                        FinancialChartType.revenue
                                    ? HexColor('#171717')
                                    : HexColor('#737373'),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ChartWidget(
              key: GlobalKey(),
              financialChartType: companyFinancialState.financialChartType,
              companyDetailModel: companyDetailModel,
            ),
          ),
        ],
      ),
    );
  }
}
