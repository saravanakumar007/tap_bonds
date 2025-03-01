// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// @nodoc


class _SplashStateInitialState implements SplashState {
  const _SplashStateInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashStateInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class _SplashStateFetchingInitialDataState implements SplashState {
  const _SplashStateFetchingInitialDataState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashStateFetchingInitialDataState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.fetchingInitialData()';
}


}




/// @nodoc


class _SplashStateSuccessState implements SplashState {
  const _SplashStateSuccessState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashStateSuccessState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.success()';
}


}




/// @nodoc


class _SplashStateFailureState implements SplashState {
  const _SplashStateFailureState({required this.message});
  

 final  String message;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashStateFailureStateCopyWith<_SplashStateFailureState> get copyWith => __$SplashStateFailureStateCopyWithImpl<_SplashStateFailureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashStateFailureState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SplashStateFailureStateCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$SplashStateFailureStateCopyWith(_SplashStateFailureState value, $Res Function(_SplashStateFailureState) _then) = __$SplashStateFailureStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SplashStateFailureStateCopyWithImpl<$Res>
    implements _$SplashStateFailureStateCopyWith<$Res> {
  __$SplashStateFailureStateCopyWithImpl(this._self, this._then);

  final _SplashStateFailureState _self;
  final $Res Function(_SplashStateFailureState) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SplashStateFailureState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
