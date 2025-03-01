import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_bonds/presentation/widgets/chart_widget.dart';
import 'package:tap_bonds/utils/extensions.dart';

class CompanyDataWidget extends StatelessWidget {
  const CompanyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> tabSelectionNotifier = ValueNotifier(0);
    return ValueListenableBuilder(
      valueListenable: tabSelectionNotifier,
      builder:
          (context, int value, child) => Column(
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
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border:
                              value == 0
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
                            color: HexColor('#1447E6'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border:
                              value == 1
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
                            color: HexColor('#4A5565'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [ChartWidget()]),
                ),
              ),
            ],
          ),
    );
  }
}
