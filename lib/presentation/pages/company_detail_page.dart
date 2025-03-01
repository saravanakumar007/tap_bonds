import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_cubit.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_state.dart';
import 'package:tap_bonds/injection.dart';
import 'package:tap_bonds/presentation/widgets/company_data_widget.dart';
import 'package:tap_bonds/presentation/widgets/company_info_widget.dart';
import 'package:tap_bonds/services/api_client_service.dart';
import 'package:tap_bonds/utils/extensions.dart';

class CompanyDetailPage extends StatefulWidget {
  const CompanyDetailPage({super.key});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CompanyDetailCubit>(context).fetchCompanyDetailData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F9FAFB'),
      body: BlocBuilder<CompanyDetailCubit, CompanyDetailState>(
        builder: (context, state) {
          if (state is CompanyDetailStateInProgress ||
              state is CompanyDetailStateInProgress) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: HexColor('#F9FAFB')),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            );
          } else if (state is CompanyDetailStateSuccess) {
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: HexColor('#F9FAFB')),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).viewPadding.top),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        width: 0.5,
                        color: HexColor('#E5E7EB'),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: HexColor('#5258660F'),
                        ),
                      ],
                    ),
                    child: Icon(Icons.arrow_back, color: HexColor('#101828')),
                  ),
                  SizedBox(height: 30),
                  CompanyInfoWidget(companyDetailModel: state.data),
                  Expanded(child: CompanyDataWidget()),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
