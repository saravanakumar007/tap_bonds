// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_financials_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyFinancialState {

 TabType get tapType; FinancialChartType get financialChartType;
/// Create a copy of CompanyFinancialState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyFinancialStateCopyWith<CompanyFinancialState> get copyWith => _$CompanyFinancialStateCopyWithImpl<CompanyFinancialState>(this as CompanyFinancialState, _$identity);

  /// Serializes this CompanyFinancialState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyFinancialState&&(identical(other.tapType, tapType) || other.tapType == tapType)&&(identical(other.financialChartType, financialChartType) || other.financialChartType == financialChartType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tapType,financialChartType);

@override
String toString() {
  return 'CompanyFinancialState(tapType: $tapType, financialChartType: $financialChartType)';
}


}

/// @nodoc
abstract mixin class $CompanyFinancialStateCopyWith<$Res>  {
  factory $CompanyFinancialStateCopyWith(CompanyFinancialState value, $Res Function(CompanyFinancialState) _then) = _$CompanyFinancialStateCopyWithImpl;
@useResult
$Res call({
 TabType tapType, FinancialChartType financialChartType
});




}
/// @nodoc
class _$CompanyFinancialStateCopyWithImpl<$Res>
    implements $CompanyFinancialStateCopyWith<$Res> {
  _$CompanyFinancialStateCopyWithImpl(this._self, this._then);

  final CompanyFinancialState _self;
  final $Res Function(CompanyFinancialState) _then;

/// Create a copy of CompanyFinancialState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tapType = null,Object? financialChartType = null,}) {
  return _then(_self.copyWith(
tapType: null == tapType ? _self.tapType : tapType // ignore: cast_nullable_to_non_nullable
as TabType,financialChartType: null == financialChartType ? _self.financialChartType : financialChartType // ignore: cast_nullable_to_non_nullable
as FinancialChartType,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CompanyFinancialState implements CompanyFinancialState {
  const _CompanyFinancialState({required this.tapType, required this.financialChartType});
  factory _CompanyFinancialState.fromJson(Map<String, dynamic> json) => _$CompanyFinancialStateFromJson(json);

@override final  TabType tapType;
@override final  FinancialChartType financialChartType;

/// Create a copy of CompanyFinancialState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyFinancialStateCopyWith<_CompanyFinancialState> get copyWith => __$CompanyFinancialStateCopyWithImpl<_CompanyFinancialState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyFinancialStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyFinancialState&&(identical(other.tapType, tapType) || other.tapType == tapType)&&(identical(other.financialChartType, financialChartType) || other.financialChartType == financialChartType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tapType,financialChartType);

@override
String toString() {
  return 'CompanyFinancialState(tapType: $tapType, financialChartType: $financialChartType)';
}


}

/// @nodoc
abstract mixin class _$CompanyFinancialStateCopyWith<$Res> implements $CompanyFinancialStateCopyWith<$Res> {
  factory _$CompanyFinancialStateCopyWith(_CompanyFinancialState value, $Res Function(_CompanyFinancialState) _then) = __$CompanyFinancialStateCopyWithImpl;
@override @useResult
$Res call({
 TabType tapType, FinancialChartType financialChartType
});




}
/// @nodoc
class __$CompanyFinancialStateCopyWithImpl<$Res>
    implements _$CompanyFinancialStateCopyWith<$Res> {
  __$CompanyFinancialStateCopyWithImpl(this._self, this._then);

  final _CompanyFinancialState _self;
  final $Res Function(_CompanyFinancialState) _then;

/// Create a copy of CompanyFinancialState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tapType = null,Object? financialChartType = null,}) {
  return _then(_CompanyFinancialState(
tapType: null == tapType ? _self.tapType : tapType // ignore: cast_nullable_to_non_nullable
as TabType,financialChartType: null == financialChartType ? _self.financialChartType : financialChartType // ignore: cast_nullable_to_non_nullable
as FinancialChartType,
  ));
}


}

// dart format on
