// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyDetailModel {

 String get logo; String get isin; String get status; String get description; List<dynamic> get pros; List<dynamic> get cons; List<Financial> get ebitda; List<Financial> get revenue; IssuerDetails? get issuerDetails;@JsonKey(name: 'company_name') String? get companyName;
/// Create a copy of CompanyDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyDetailModelCopyWith<CompanyDetailModel> get copyWith => _$CompanyDetailModelCopyWithImpl<CompanyDetailModel>(this as CompanyDetailModel, _$identity);

  /// Serializes this CompanyDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyDetailModel&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.pros, pros)&&const DeepCollectionEquality().equals(other.cons, cons)&&const DeepCollectionEquality().equals(other.ebitda, ebitda)&&const DeepCollectionEquality().equals(other.revenue, revenue)&&(identical(other.issuerDetails, issuerDetails) || other.issuerDetails == issuerDetails)&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,logo,isin,status,description,const DeepCollectionEquality().hash(pros),const DeepCollectionEquality().hash(cons),const DeepCollectionEquality().hash(ebitda),const DeepCollectionEquality().hash(revenue),issuerDetails,companyName);

@override
String toString() {
  return 'CompanyDetailModel(logo: $logo, isin: $isin, status: $status, description: $description, pros: $pros, cons: $cons, ebitda: $ebitda, revenue: $revenue, issuerDetails: $issuerDetails, companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class $CompanyDetailModelCopyWith<$Res>  {
  factory $CompanyDetailModelCopyWith(CompanyDetailModel value, $Res Function(CompanyDetailModel) _then) = _$CompanyDetailModelCopyWithImpl;
@useResult
$Res call({
 String logo, String isin, String status, String description, List<dynamic> pros, List<dynamic> cons, List<Financial> ebitda, List<Financial> revenue, IssuerDetails? issuerDetails,@JsonKey(name: 'company_name') String? companyName
});


$IssuerDetailsCopyWith<$Res>? get issuerDetails;

}
/// @nodoc
class _$CompanyDetailModelCopyWithImpl<$Res>
    implements $CompanyDetailModelCopyWith<$Res> {
  _$CompanyDetailModelCopyWithImpl(this._self, this._then);

  final CompanyDetailModel _self;
  final $Res Function(CompanyDetailModel) _then;

/// Create a copy of CompanyDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logo = null,Object? isin = null,Object? status = null,Object? description = null,Object? pros = null,Object? cons = null,Object? ebitda = null,Object? revenue = null,Object? issuerDetails = freezed,Object? companyName = freezed,}) {
  return _then(_self.copyWith(
logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,isin: null == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pros: null == pros ? _self.pros : pros // ignore: cast_nullable_to_non_nullable
as List<dynamic>,cons: null == cons ? _self.cons : cons // ignore: cast_nullable_to_non_nullable
as List<dynamic>,ebitda: null == ebitda ? _self.ebitda : ebitda // ignore: cast_nullable_to_non_nullable
as List<Financial>,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as List<Financial>,issuerDetails: freezed == issuerDetails ? _self.issuerDetails : issuerDetails // ignore: cast_nullable_to_non_nullable
as IssuerDetails?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CompanyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuerDetailsCopyWith<$Res>? get issuerDetails {
    if (_self.issuerDetails == null) {
    return null;
  }

  return $IssuerDetailsCopyWith<$Res>(_self.issuerDetails!, (value) {
    return _then(_self.copyWith(issuerDetails: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CompanyDetailModel implements CompanyDetailModel {
  const _CompanyDetailModel({required this.logo, required this.isin, required this.status, required this.description, final  List<dynamic> pros = const [], final  List<dynamic> cons = const [], final  List<Financial> ebitda = const [], final  List<Financial> revenue = const [], this.issuerDetails, @JsonKey(name: 'company_name') required this.companyName}): _pros = pros,_cons = cons,_ebitda = ebitda,_revenue = revenue;
  factory _CompanyDetailModel.fromJson(Map<String, dynamic> json) => _$CompanyDetailModelFromJson(json);

@override final  String logo;
@override final  String isin;
@override final  String status;
@override final  String description;
 final  List<dynamic> _pros;
@override@JsonKey() List<dynamic> get pros {
  if (_pros is EqualUnmodifiableListView) return _pros;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pros);
}

 final  List<dynamic> _cons;
@override@JsonKey() List<dynamic> get cons {
  if (_cons is EqualUnmodifiableListView) return _cons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cons);
}

 final  List<Financial> _ebitda;
@override@JsonKey() List<Financial> get ebitda {
  if (_ebitda is EqualUnmodifiableListView) return _ebitda;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ebitda);
}

 final  List<Financial> _revenue;
@override@JsonKey() List<Financial> get revenue {
  if (_revenue is EqualUnmodifiableListView) return _revenue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revenue);
}

@override final  IssuerDetails? issuerDetails;
@override@JsonKey(name: 'company_name') final  String? companyName;

/// Create a copy of CompanyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyDetailModelCopyWith<_CompanyDetailModel> get copyWith => __$CompanyDetailModelCopyWithImpl<_CompanyDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyDetailModel&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.isin, isin) || other.isin == isin)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._pros, _pros)&&const DeepCollectionEquality().equals(other._cons, _cons)&&const DeepCollectionEquality().equals(other._ebitda, _ebitda)&&const DeepCollectionEquality().equals(other._revenue, _revenue)&&(identical(other.issuerDetails, issuerDetails) || other.issuerDetails == issuerDetails)&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,logo,isin,status,description,const DeepCollectionEquality().hash(_pros),const DeepCollectionEquality().hash(_cons),const DeepCollectionEquality().hash(_ebitda),const DeepCollectionEquality().hash(_revenue),issuerDetails,companyName);

@override
String toString() {
  return 'CompanyDetailModel(logo: $logo, isin: $isin, status: $status, description: $description, pros: $pros, cons: $cons, ebitda: $ebitda, revenue: $revenue, issuerDetails: $issuerDetails, companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class _$CompanyDetailModelCopyWith<$Res> implements $CompanyDetailModelCopyWith<$Res> {
  factory _$CompanyDetailModelCopyWith(_CompanyDetailModel value, $Res Function(_CompanyDetailModel) _then) = __$CompanyDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String logo, String isin, String status, String description, List<dynamic> pros, List<dynamic> cons, List<Financial> ebitda, List<Financial> revenue, IssuerDetails? issuerDetails,@JsonKey(name: 'company_name') String? companyName
});


@override $IssuerDetailsCopyWith<$Res>? get issuerDetails;

}
/// @nodoc
class __$CompanyDetailModelCopyWithImpl<$Res>
    implements _$CompanyDetailModelCopyWith<$Res> {
  __$CompanyDetailModelCopyWithImpl(this._self, this._then);

  final _CompanyDetailModel _self;
  final $Res Function(_CompanyDetailModel) _then;

/// Create a copy of CompanyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logo = null,Object? isin = null,Object? status = null,Object? description = null,Object? pros = null,Object? cons = null,Object? ebitda = null,Object? revenue = null,Object? issuerDetails = freezed,Object? companyName = freezed,}) {
  return _then(_CompanyDetailModel(
logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,isin: null == isin ? _self.isin : isin // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pros: null == pros ? _self._pros : pros // ignore: cast_nullable_to_non_nullable
as List<dynamic>,cons: null == cons ? _self._cons : cons // ignore: cast_nullable_to_non_nullable
as List<dynamic>,ebitda: null == ebitda ? _self._ebitda : ebitda // ignore: cast_nullable_to_non_nullable
as List<Financial>,revenue: null == revenue ? _self._revenue : revenue // ignore: cast_nullable_to_non_nullable
as List<Financial>,issuerDetails: freezed == issuerDetails ? _self.issuerDetails : issuerDetails // ignore: cast_nullable_to_non_nullable
as IssuerDetails?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CompanyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuerDetailsCopyWith<$Res>? get issuerDetails {
    if (_self.issuerDetails == null) {
    return null;
  }

  return $IssuerDetailsCopyWith<$Res>(_self.issuerDetails!, (value) {
    return _then(_self.copyWith(issuerDetails: value));
  });
}
}


/// @nodoc
mixin _$Financial {

 String get month; int get value;
/// Create a copy of Financial
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinancialCopyWith<Financial> get copyWith => _$FinancialCopyWithImpl<Financial>(this as Financial, _$identity);

  /// Serializes this Financial to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Financial&&(identical(other.month, month) || other.month == month)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,value);

@override
String toString() {
  return 'Financial(month: $month, value: $value)';
}


}

/// @nodoc
abstract mixin class $FinancialCopyWith<$Res>  {
  factory $FinancialCopyWith(Financial value, $Res Function(Financial) _then) = _$FinancialCopyWithImpl;
@useResult
$Res call({
 String month, int value
});




}
/// @nodoc
class _$FinancialCopyWithImpl<$Res>
    implements $FinancialCopyWith<$Res> {
  _$FinancialCopyWithImpl(this._self, this._then);

  final Financial _self;
  final $Res Function(Financial) _then;

/// Create a copy of Financial
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? value = null,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Financial implements Financial {
  const _Financial({required this.month, required this.value});
  factory _Financial.fromJson(Map<String, dynamic> json) => _$FinancialFromJson(json);

@override final  String month;
@override final  int value;

/// Create a copy of Financial
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinancialCopyWith<_Financial> get copyWith => __$FinancialCopyWithImpl<_Financial>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinancialToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Financial&&(identical(other.month, month) || other.month == month)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,value);

@override
String toString() {
  return 'Financial(month: $month, value: $value)';
}


}

/// @nodoc
abstract mixin class _$FinancialCopyWith<$Res> implements $FinancialCopyWith<$Res> {
  factory _$FinancialCopyWith(_Financial value, $Res Function(_Financial) _then) = __$FinancialCopyWithImpl;
@override @useResult
$Res call({
 String month, int value
});




}
/// @nodoc
class __$FinancialCopyWithImpl<$Res>
    implements _$FinancialCopyWith<$Res> {
  __$FinancialCopyWithImpl(this._self, this._then);

  final _Financial _self;
  final $Res Function(_Financial) _then;

/// Create a copy of Financial
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? value = null,}) {
  return _then(_Financial(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$IssuerDetails {

@JsonKey(name: 'issuer_name') String get issuerName;@JsonKey(name: 'type_of_issuer') String get typeOfIssuer;@JsonKey(name: 'lead_manager') String get leadManager;@JsonKey(name: 'debenture_trustee') String get debentureTrustee; String get sector; String get industry; String get cin; String get registrar;
/// Create a copy of IssuerDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssuerDetailsCopyWith<IssuerDetails> get copyWith => _$IssuerDetailsCopyWithImpl<IssuerDetails>(this as IssuerDetails, _$identity);

  /// Serializes this IssuerDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssuerDetails&&(identical(other.issuerName, issuerName) || other.issuerName == issuerName)&&(identical(other.typeOfIssuer, typeOfIssuer) || other.typeOfIssuer == typeOfIssuer)&&(identical(other.leadManager, leadManager) || other.leadManager == leadManager)&&(identical(other.debentureTrustee, debentureTrustee) || other.debentureTrustee == debentureTrustee)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.industry, industry) || other.industry == industry)&&(identical(other.cin, cin) || other.cin == cin)&&(identical(other.registrar, registrar) || other.registrar == registrar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,issuerName,typeOfIssuer,leadManager,debentureTrustee,sector,industry,cin,registrar);

@override
String toString() {
  return 'IssuerDetails(issuerName: $issuerName, typeOfIssuer: $typeOfIssuer, leadManager: $leadManager, debentureTrustee: $debentureTrustee, sector: $sector, industry: $industry, cin: $cin, registrar: $registrar)';
}


}

/// @nodoc
abstract mixin class $IssuerDetailsCopyWith<$Res>  {
  factory $IssuerDetailsCopyWith(IssuerDetails value, $Res Function(IssuerDetails) _then) = _$IssuerDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'issuer_name') String issuerName,@JsonKey(name: 'type_of_issuer') String typeOfIssuer,@JsonKey(name: 'lead_manager') String leadManager,@JsonKey(name: 'debenture_trustee') String debentureTrustee, String sector, String industry, String cin, String registrar
});




}
/// @nodoc
class _$IssuerDetailsCopyWithImpl<$Res>
    implements $IssuerDetailsCopyWith<$Res> {
  _$IssuerDetailsCopyWithImpl(this._self, this._then);

  final IssuerDetails _self;
  final $Res Function(IssuerDetails) _then;

/// Create a copy of IssuerDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? issuerName = null,Object? typeOfIssuer = null,Object? leadManager = null,Object? debentureTrustee = null,Object? sector = null,Object? industry = null,Object? cin = null,Object? registrar = null,}) {
  return _then(_self.copyWith(
issuerName: null == issuerName ? _self.issuerName : issuerName // ignore: cast_nullable_to_non_nullable
as String,typeOfIssuer: null == typeOfIssuer ? _self.typeOfIssuer : typeOfIssuer // ignore: cast_nullable_to_non_nullable
as String,leadManager: null == leadManager ? _self.leadManager : leadManager // ignore: cast_nullable_to_non_nullable
as String,debentureTrustee: null == debentureTrustee ? _self.debentureTrustee : debentureTrustee // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,industry: null == industry ? _self.industry : industry // ignore: cast_nullable_to_non_nullable
as String,cin: null == cin ? _self.cin : cin // ignore: cast_nullable_to_non_nullable
as String,registrar: null == registrar ? _self.registrar : registrar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IssuerDetails implements IssuerDetails {
  const _IssuerDetails({@JsonKey(name: 'issuer_name') required this.issuerName, @JsonKey(name: 'type_of_issuer') required this.typeOfIssuer, @JsonKey(name: 'lead_manager') required this.leadManager, @JsonKey(name: 'debenture_trustee') required this.debentureTrustee, required this.sector, required this.industry, required this.cin, required this.registrar});
  factory _IssuerDetails.fromJson(Map<String, dynamic> json) => _$IssuerDetailsFromJson(json);

@override@JsonKey(name: 'issuer_name') final  String issuerName;
@override@JsonKey(name: 'type_of_issuer') final  String typeOfIssuer;
@override@JsonKey(name: 'lead_manager') final  String leadManager;
@override@JsonKey(name: 'debenture_trustee') final  String debentureTrustee;
@override final  String sector;
@override final  String industry;
@override final  String cin;
@override final  String registrar;

/// Create a copy of IssuerDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssuerDetailsCopyWith<_IssuerDetails> get copyWith => __$IssuerDetailsCopyWithImpl<_IssuerDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssuerDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssuerDetails&&(identical(other.issuerName, issuerName) || other.issuerName == issuerName)&&(identical(other.typeOfIssuer, typeOfIssuer) || other.typeOfIssuer == typeOfIssuer)&&(identical(other.leadManager, leadManager) || other.leadManager == leadManager)&&(identical(other.debentureTrustee, debentureTrustee) || other.debentureTrustee == debentureTrustee)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.industry, industry) || other.industry == industry)&&(identical(other.cin, cin) || other.cin == cin)&&(identical(other.registrar, registrar) || other.registrar == registrar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,issuerName,typeOfIssuer,leadManager,debentureTrustee,sector,industry,cin,registrar);

@override
String toString() {
  return 'IssuerDetails(issuerName: $issuerName, typeOfIssuer: $typeOfIssuer, leadManager: $leadManager, debentureTrustee: $debentureTrustee, sector: $sector, industry: $industry, cin: $cin, registrar: $registrar)';
}


}

/// @nodoc
abstract mixin class _$IssuerDetailsCopyWith<$Res> implements $IssuerDetailsCopyWith<$Res> {
  factory _$IssuerDetailsCopyWith(_IssuerDetails value, $Res Function(_IssuerDetails) _then) = __$IssuerDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'issuer_name') String issuerName,@JsonKey(name: 'type_of_issuer') String typeOfIssuer,@JsonKey(name: 'lead_manager') String leadManager,@JsonKey(name: 'debenture_trustee') String debentureTrustee, String sector, String industry, String cin, String registrar
});




}
/// @nodoc
class __$IssuerDetailsCopyWithImpl<$Res>
    implements _$IssuerDetailsCopyWith<$Res> {
  __$IssuerDetailsCopyWithImpl(this._self, this._then);

  final _IssuerDetails _self;
  final $Res Function(_IssuerDetails) _then;

/// Create a copy of IssuerDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? issuerName = null,Object? typeOfIssuer = null,Object? leadManager = null,Object? debentureTrustee = null,Object? sector = null,Object? industry = null,Object? cin = null,Object? registrar = null,}) {
  return _then(_IssuerDetails(
issuerName: null == issuerName ? _self.issuerName : issuerName // ignore: cast_nullable_to_non_nullable
as String,typeOfIssuer: null == typeOfIssuer ? _self.typeOfIssuer : typeOfIssuer // ignore: cast_nullable_to_non_nullable
as String,leadManager: null == leadManager ? _self.leadManager : leadManager // ignore: cast_nullable_to_non_nullable
as String,debentureTrustee: null == debentureTrustee ? _self.debentureTrustee : debentureTrustee // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,industry: null == industry ? _self.industry : industry // ignore: cast_nullable_to_non_nullable
as String,cin: null == cin ? _self.cin : cin // ignore: cast_nullable_to_non_nullable
as String,registrar: null == registrar ? _self.registrar : registrar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
