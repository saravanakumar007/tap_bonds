import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_state.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';
import 'package:tap_bonds/data/repositories/company_list_repository.dart';

@injectable
class CompanyListCubit extends Cubit<CompanyListState> {
  CompanyListCubit(this.companyListRepository)
    : super(const CompanyListState.initial());

  final CompanyListRepository companyListRepository;

  Future<List<CompanyModel>> fetchCompanyListData() async {
    emit(CompanyListState.inProgress());
    final List<dynamic> jsonData =
        await companyListRepository.fetchCompanyListData();
    final List<CompanyModel> companyList =
        jsonData.map((e) => CompanyModel.fromJson(e)).toList();
    emit(CompanyListState.success(data: companyList));
    return companyList;
  }

  void onSearchValueChange(String searchQuery, List<CompanyModel> companyList) {
    emit(CompanyListState.inProgress());

    final List<String> searchWords = searchQuery.trim().split(' ');
    final List<CompanyModel> searchCollection =
        companyList.where((CompanyModel companyData) {
          bool value = false;
          for (final String key in searchWords) {
            if (companyData.isin.toLowerCase().contains(key.toLowerCase()) ||
                ('${companyData.rating} . ${companyData.companyName ?? ''}')
                    .toLowerCase()
                    .contains(key.toLowerCase())) {
              value = true;
              break;
            }
          }
          return value;
        }).toList();
    emit(CompanyListState.success(data: searchCollection));
  }
}
