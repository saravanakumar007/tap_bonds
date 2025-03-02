import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tap_bonds/data/models/company_model/company_model.dart';

part 'company_list_state.freezed.dart';

@freezed
abstract class CompanyListState with _$CompanyListState {
  const CompanyListState._();

  const factory CompanyListState.initial() = CompanyListStateInitial;

  const factory CompanyListState.inProgress() = CompanyListStateInProgress;

  const factory CompanyListState.success({required List<CompanyModel> data}) =
      CompanyListStateSuccess;

  const factory CompanyListState.failure({required String message}) =
      CompanyListStateFailure;
}
