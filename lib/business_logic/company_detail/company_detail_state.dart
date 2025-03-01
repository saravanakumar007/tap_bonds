import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tap_bonds/data/models/company_detail_model/company_detail_model.dart';

part 'company_detail_state.freezed.dart';

@freezed
abstract class CompanyDetailState with _$CompanyDetailState {
  const CompanyDetailState._();

  const factory CompanyDetailState.initial() = CompanyDetailStateInitial;

  const factory CompanyDetailState.inProgress() = CompanyDetailStateInProgress;

  const factory CompanyDetailState.success({required CompanyDetailModel data}) =
      CompanyDetailStateSuccess;
}
