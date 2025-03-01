import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _SplashStateInitialState;

  const factory SplashState.fetchingInitialData() =
      _SplashStateFetchingInitialDataState;

  const factory SplashState.success() = _SplashStateSuccessState;

  const factory SplashState.failure({required String message}) =
      _SplashStateFailureState;
}
