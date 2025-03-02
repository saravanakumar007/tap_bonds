// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyDetailModel _$CompanyDetailModelFromJson(Map<String, dynamic> json) =>
    _CompanyDetailModel(
      logo: json['logo'] as String,
      isin: json['isin'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
      pros: json['pros'] as List<dynamic>? ?? const [],
      cons: json['cons'] as List<dynamic>? ?? const [],
      ebitda:
          (json['ebitda'] as List<dynamic>?)
              ?.map((e) => Financial.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      revenue:
          (json['revenue'] as List<dynamic>?)
              ?.map((e) => Financial.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      issuerDetails:
          json['issuerDetails'] == null
              ? null
              : IssuerDetails.fromJson(
                json['issuerDetails'] as Map<String, dynamic>,
              ),
      companyName: json['company_name'] as String?,
    );

Map<String, dynamic> _$CompanyDetailModelToJson(_CompanyDetailModel instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'isin': instance.isin,
      'status': instance.status,
      'description': instance.description,
      'pros': instance.pros,
      'cons': instance.cons,
      'ebitda': instance.ebitda,
      'revenue': instance.revenue,
      'issuerDetails': instance.issuerDetails,
      'company_name': instance.companyName,
    };

_Financial _$FinancialFromJson(Map<String, dynamic> json) => _Financial(
  month: json['month'] as String,
  value: (json['value'] as num).toInt(),
);

Map<String, dynamic> _$FinancialToJson(_Financial instance) =>
    <String, dynamic>{'month': instance.month, 'value': instance.value};

_IssuerDetails _$IssuerDetailsFromJson(Map<String, dynamic> json) =>
    _IssuerDetails(
      issuerName: json['issuer_name'] as String,
      typeOfIssuer: json['type_of_issuer'] as String,
      leadManager: json['lead_manager'] as String,
      debentureTrustee: json['debenture_trustee'] as String,
      issuerNature: json['issuer_nature'] as String,
      sector: json['sector'] as String,
      industry: json['industry'] as String,
      cin: json['cin'] as String,
      registrar: json['registrar'] as String,
    );

Map<String, dynamic> _$IssuerDetailsToJson(_IssuerDetails instance) =>
    <String, dynamic>{
      'issuer_name': instance.issuerName,
      'type_of_issuer': instance.typeOfIssuer,
      'lead_manager': instance.leadManager,
      'debenture_trustee': instance.debentureTrustee,
      'issuer_nature': instance.issuerNature,
      'sector': instance.sector,
      'industry': instance.industry,
      'cin': instance.cin,
      'registrar': instance.registrar,
    };
