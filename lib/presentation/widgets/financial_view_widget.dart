import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_bonds/business_logic/company_financials/company_financials_cubit.dart';
import 'package:tap_bonds/business_logic/company_financials/company_financials_state.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/presentation/widgets/financial_data_widget.dart';
import 'package:tap_bonds/presentation/widgets/issuer_details_widget.dart';
import 'package:tap_bonds/presentation/widgets/prod_and_cons_widget.dart';
import 'package:tap_bonds/utils/extensions.dart';

class FinancialViewWidget extends StatelessWidget {
  const FinancialViewWidget({super.key, required this.companyDetailModel});

  final CompanyDetailModel companyDetailModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyFinancialsCubit, CompanyFinancialState>(
      builder:
          (context, state) => Column(
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: HexColor('#E7E5E4')),
                  ),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        BlocProvider.of<CompanyFinancialsCubit>(
                          context,
                        ).changeTabType(TabType.isinAnalysisTab);
                        await HapticFeedback.mediumImpact();
                      },
                      child: Container(
                        key: ValueKey('ISIN_Analysis'),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border:
                              state.tapType == TabType.isinAnalysisTab
                                  ? Border(
                                    bottom: BorderSide(
                                      width: 4,
                                      color: HexColor('#1447E6'),
                                    ),
                                  )
                                  : null,
                        ),
                        child: Text(
                          'ISIN Analysis',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: HexColor(
                              state.tapType == TabType.isinAnalysisTab
                                  ? '#1447E6'
                                  : '#4A5565',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () async {
                        BlocProvider.of<CompanyFinancialsCubit>(
                          context,
                        ).changeTabType(TabType.prosAndConsTab);
                        await HapticFeedback.mediumImpact();
                      },
                      child: Container(
                        key: ValueKey('pros_and_cons'),
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border:
                              state.tapType == TabType.prosAndConsTab
                                  ? Border(
                                    bottom: BorderSide(
                                      width: 4,
                                      color: HexColor('#1447E6'),
                                    ),
                                  )
                                  : null,
                        ),
                        child: Text(
                          'Pros & Cons',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: HexColor(
                              state.tapType == TabType.prosAndConsTab
                                  ? '#1447E6'
                                  : '#4A5565',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 20),

                  if (state.tapType == TabType.isinAnalysisTab) ...[
                    FinancialDataWidget(
                      companyFinancialState: state,
                      companyDetailModel: companyDetailModel,
                    ),
                    SizedBox(height: 30),
                    IssuerDetailsWidget(
                      issuerDetailsData: companyDetailModel.issuerDetails!,
                    ),
                  ] else ...[
                    ProdAndConsWidget(
                      pros: companyDetailModel.pros,
                      cons: companyDetailModel.cons,
                    ),
                  ],
                ],
              ),
            ],
          ),
    );
  }
}
