import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_detail_model.freezed.dart';
part 'company_detail_model.g.dart';

@freezed
abstract class CompanyDetailModel with _$CompanyDetailModel {
  const factory CompanyDetailModel({
    required String logo,
    required String isin,
    required String status,
    required String description,
    @Default([]) List<dynamic> pros,
    @Default([]) List<dynamic> cons,
    @Default([]) List<Financial> ebitda,
    @Default([]) List<Financial> revenue,
    IssuerDetails? issuerDetails,
    @JsonKey(name: 'company_name') required String? companyName,
  }) = _CompanyDetailModel;

  factory CompanyDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailModelFromJson(json);
}

@freezed
abstract class Financial with _$Financial {
  const factory Financial({required String month, required int value}) =
      _Financial;

  factory Financial.fromJson(Map<String, dynamic> json) =>
      _$FinancialFromJson(json);
}

@freezed
abstract class IssuerDetails with _$IssuerDetails {
  const factory IssuerDetails({
    @JsonKey(name: 'issuer_name') required String issuerName,
    @JsonKey(name: 'type_of_issuer') required String typeOfIssuer,
    @JsonKey(name: 'lead_manager') required String leadManager,
    @JsonKey(name: 'debenture_trustee') required String debentureTrustee,
    required String sector,
    required String industry,
    required String cin,
    required String registrar,
  }) = _IssuerDetails;

  factory IssuerDetails.fromJson(Map<String, dynamic> json) =>
      _$IssuerDetailsFromJson(json);
}
