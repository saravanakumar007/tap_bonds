import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tap_bonds/business_logic/splash/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  /// We can get app configuration data from Remote config or invoke API call
  Future<void> fetchInitialAppData() async {
    emit(const SplashState.fetchingInitialData());
    await Future.delayed(Duration(seconds: 2));
    emit(const SplashState.success());
  }
}
