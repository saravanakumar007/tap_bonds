import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_cubit.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_state.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';
import 'package:tap_bonds/presentation/widgets/company_widget.dart';
import 'package:tap_bonds/utils/extensions.dart';

class CompanyListPage extends StatefulWidget {
  const CompanyListPage({super.key});

  @override
  State<CompanyListPage> createState() => _CompanyListPageState();
}

class _CompanyListPageState extends State<CompanyListPage> {
  List<CompanyModel> actualCompanyData = [];
  final TextEditingController searchtextEditingController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    actualCompanyData =
        await BlocProvider.of<CompanyListCubit>(context).fetchCompanyListData();
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: HexColor('#E5E7EB')),
    );
    return Scaffold(
      backgroundColor: HexColor('#F3F4F6'),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: HexColor('#F3F4F6'),
        title: Text(
          'Home',
          style: GoogleFonts.inter(
            color: HexColor('#000000'),
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),

        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchtextEditingController,
              onChanged: (value) {
                BlocProvider.of<CompanyListCubit>(context).onSearchValueChange(
                  searchtextEditingController.text,
                  List.from(actualCompanyData),
                );
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: HexColor('#6A7282')),
                fillColor: Colors.white,
                filled: true,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                hintText: 'Search by Issuer Name or ISIN',
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: HexColor('#99A1AF'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'SUGGESTED RESULTS',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: HexColor('#99A1AF'),
              ),
            ),
            SizedBox(height: 10),
            BlocBuilder<CompanyListCubit, CompanyListState>(
              builder: (context, state) {
                if (state is CompanyListStateInitial ||
                    state is CompanyListStateInProgress) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  );
                } else if (state is CompanyListStateSuccess) {
                  return state.data.isNotEmpty
                      ? Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.65,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 20),
                                padding: EdgeInsets.all(20),
                                itemCount: state.data.length,
                                itemBuilder:
                                    (context, index) => CompanyWidget(
                                      companyModel: state.data[index],
                                      searchQuery:
                                          searchtextEditingController.text,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )
                      : Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'No Data Found',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#101828'),
                            ),
                          ),
                        ),
                      );
                } else {
                  return Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Text(
                        'No Data Found',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#101828'),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
