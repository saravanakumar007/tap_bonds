// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) =>
    _CompanyModel(
      logo: json['logo'] as String,
      isin: json['isin'] as String,
      rating: json['rating'] as String,
      companyName: json['company_name'] as String?,
    );

Map<String, dynamic> _$CompanyModelToJson(_CompanyModel instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'isin': instance.isin,
      'rating': instance.rating,
      'company_name': instance.companyName,
    };
