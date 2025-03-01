// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tap_bonds/business_logic/company_list/company_list_cubit.dart'
    as _i1029;
import 'package:tap_bonds/business_logic/splash/splash_cubit.dart' as _i968;
import 'package:tap_bonds/data/repositories/company_list_repository.dart'
    as _i1026;
import 'package:tap_bonds/services/api_client_service.dart' as _i758;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i968.SplashCubit>(() => _i968.SplashCubit());
    gh.singleton<_i758.ApiClientService>(() => _i758.ApiClientService());
    gh.singleton<_i1026.CompanyListRepository>(
      () => _i1026.CompanyListRepository(gh<_i758.ApiClientService>()),
    );
    gh.factory<_i1029.CompanyListCubit>(
      () => _i1029.CompanyListCubit(gh<_i1026.CompanyListRepository>()),
    );
    return this;
  }
}
