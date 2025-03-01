// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyListState()';
}


}

/// @nodoc
class $CompanyListStateCopyWith<$Res>  {
$CompanyListStateCopyWith(CompanyListState _, $Res Function(CompanyListState) __);
}


/// @nodoc


class CompanyListStateInitial extends CompanyListState {
  const CompanyListStateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyListStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyListState.initial()';
}


}




/// @nodoc


class CompanyListStateInProgress extends CompanyListState {
  const CompanyListStateInProgress(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyListStateInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyListState.inProgress()';
}


}




/// @nodoc


class CompanyListStateSuccess extends CompanyListState {
  const CompanyListStateSuccess({required final  List<CompanyModel> data}): _data = data,super._();
  

 final  List<CompanyModel> _data;
 List<CompanyModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CompanyListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyListStateSuccessCopyWith<CompanyListStateSuccess> get copyWith => _$CompanyListStateSuccessCopyWithImpl<CompanyListStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyListStateSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CompanyListState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $CompanyListStateSuccessCopyWith<$Res> implements $CompanyListStateCopyWith<$Res> {
  factory $CompanyListStateSuccessCopyWith(CompanyListStateSuccess value, $Res Function(CompanyListStateSuccess) _then) = _$CompanyListStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<CompanyModel> data
});




}
/// @nodoc
class _$CompanyListStateSuccessCopyWithImpl<$Res>
    implements $CompanyListStateSuccessCopyWith<$Res> {
  _$CompanyListStateSuccessCopyWithImpl(this._self, this._then);

  final CompanyListStateSuccess _self;
  final $Res Function(CompanyListStateSuccess) _then;

/// Create a copy of CompanyListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CompanyListStateSuccess(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,
  ));
}


}

// dart format on
