// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyDetailState()';
}


}

/// @nodoc
class $CompanyDetailStateCopyWith<$Res>  {
$CompanyDetailStateCopyWith(CompanyDetailState _, $Res Function(CompanyDetailState) __);
}


/// @nodoc


class CompanyDetailStateInitial extends CompanyDetailState {
  const CompanyDetailStateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyDetailStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyDetailState.initial()';
}


}




/// @nodoc


class CompanyDetailStateInProgress extends CompanyDetailState {
  const CompanyDetailStateInProgress(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyDetailStateInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyDetailState.inProgress()';
}


}




/// @nodoc


class CompanyDetailStateSuccess extends CompanyDetailState {
  const CompanyDetailStateSuccess({required this.data}): super._();
  

 final  CompanyDetailModel data;

/// Create a copy of CompanyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyDetailStateSuccessCopyWith<CompanyDetailStateSuccess> get copyWith => _$CompanyDetailStateSuccessCopyWithImpl<CompanyDetailStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyDetailStateSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CompanyDetailState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $CompanyDetailStateSuccessCopyWith<$Res> implements $CompanyDetailStateCopyWith<$Res> {
  factory $CompanyDetailStateSuccessCopyWith(CompanyDetailStateSuccess value, $Res Function(CompanyDetailStateSuccess) _then) = _$CompanyDetailStateSuccessCopyWithImpl;
@useResult
$Res call({
 CompanyDetailModel data
});


$CompanyDetailModelCopyWith<$Res> get data;

}
/// @nodoc
class _$CompanyDetailStateSuccessCopyWithImpl<$Res>
    implements $CompanyDetailStateSuccessCopyWith<$Res> {
  _$CompanyDetailStateSuccessCopyWithImpl(this._self, this._then);

  final CompanyDetailStateSuccess _self;
  final $Res Function(CompanyDetailStateSuccess) _then;

/// Create a copy of CompanyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CompanyDetailStateSuccess(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CompanyDetailModel,
  ));
}

/// Create a copy of CompanyDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyDetailModelCopyWith<$Res> get data {
  
  return $CompanyDetailModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
