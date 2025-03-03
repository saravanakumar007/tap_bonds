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
        child: BlocBuilder<CompanyListCubit, CompanyListState>(
          builder: (context, state) {
            if (state is CompanyListStateInitial ||
                state is CompanyListStateInProgress) {
              return Column(
                children: [
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is CompanyListStateSuccess) {
              return _builtCompanyListWidgets(state.data);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _builtCompanyListWidgets(List<CompanyModel> companyList) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: HexColor('#E5E7EB')),
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            key: ValueKey('search_bar'),
            controller: searchtextEditingController,
            onChanged: (value) {
              BlocProvider.of<CompanyListCubit>(context).onSearchValueChange(
                searchtextEditingController.text,
                List.from(actualCompanyData),
              );
            },
            cursorColor: Colors.black,
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

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (companyList.isEmpty) ...[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: EdgeInsets.all(20),
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
                  ),
                ] else ...[
                  ...List.generate(
                    companyList.length,
                    (int index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: CompanyWidget(
                        companyModel: companyList[index],
                        searchQuery: searchtextEditingController.text,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
