// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_messenger/datasources/prefs_datasource.dart' as _i3;
import 'package:flutter_messenger/screens/auth/auth_cubit.dart' as _i9;
import 'package:flutter_messenger/screens/home/home_cubit.dart' as _i10;
import 'package:flutter_messenger/usecases/check_auth_status.dart' as _i7;
import 'package:flutter_messenger/usecases/log_out.dart' as _i8;
import 'package:flutter_messenger/usecases/sign_in.dart' as _i5;
import 'package:flutter_messenger/usecases/sign_up.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.SharedPreferencesDatasource>(
        () => _i3.SharedPreferencesDatasource(gh<_i4.SharedPreferences>()));
    gh.factory<_i5.SignInUseCase>(
        () => _i5.SignInUseCase(gh<_i3.SharedPreferencesDatasource>()));
    gh.factory<_i6.SignUpUseCase>(
        () => _i6.SignUpUseCase(gh<_i3.SharedPreferencesDatasource>()));
    gh.factory<_i7.CheckAuthStatusUseCase>(() =>
        _i7.CheckAuthStatusUseCase(gh<_i3.SharedPreferencesDatasource>()));
    gh.factory<_i8.LogOutUseCase>(
        () => _i8.LogOutUseCase(gh<_i3.SharedPreferencesDatasource>()));
    gh.factory<_i9.AuthCubit>(() => _i9.AuthCubit(
          gh<_i6.SignUpUseCase>(),
          gh<_i5.SignInUseCase>(),
          gh<_i7.CheckAuthStatusUseCase>(),
        ));
    gh.factory<_i10.HomeCubit>(() => _i10.HomeCubit(gh<_i8.LogOutUseCase>()));
    return this;
  }
}
