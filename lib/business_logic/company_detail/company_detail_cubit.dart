import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tap_bonds/business_logic/company_detail/company_detail_state.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';
import 'package:tap_bonds/data/repositories/company_detail_repository.dart';

@injectable
class CompanyDetailCubit extends Cubit<CompanyDetailState> {
  CompanyDetailCubit(this.companyDetailRepository)
    : super(const CompanyDetailState.initial());

  final CompanyDetailRepository companyDetailRepository;

  Future<void> fetchCompanyDetailData() async {
    emit(CompanyDetailState.inProgress());
    final Map<String, dynamic> jsonData =
        await companyDetailRepository.fetchCompanyDetailData();

    CompanyDetailModel companyDetailModel = CompanyDetailModel.fromJson(
      jsonData,
    );
    companyDetailModel = companyDetailModel.copyWith(
      pros: jsonData['pros_and_cons']['pros'],
      cons: jsonData['pros_and_cons']['cons'],
      ebitda:
          (jsonData['financials']['ebitda'] as List<dynamic>)
              .map((e) => Financial.fromJson(e))
              .toList(),
      revenue:
          (jsonData['financials']['revenue'] as List<dynamic>)
              .map((e) => Financial.fromJson(e))
              .toList(),
      issuerDetails: IssuerDetails.fromJson(jsonData['issuer_details']),
    );
    emit(CompanyDetailState.success(data: companyDetailModel));
  }
}
