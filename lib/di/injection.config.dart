// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_messenger/datasources/prefs_datasource.dart' as _i4;
import 'package:flutter_messenger/screens/auth/auth_cubit.dart' as _i11;
import 'package:flutter_messenger/screens/home/home_cubit.dart' as _i12;
import 'package:flutter_messenger/screens/search/search_cubit.dart' as _i10;
import 'package:flutter_messenger/usecases/check_auth_status.dart' as _i8;
import 'package:flutter_messenger/usecases/log_out.dart' as _i9;
import 'package:flutter_messenger/usecases/search_users_by_email.dart' as _i3;
import 'package:flutter_messenger/usecases/sign_in.dart' as _i6;
import 'package:flutter_messenger/usecases/sign_up.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

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
    gh.factory<_i3.SearchUsersByEmailUseCase>(
        () => _i3.SearchUsersByEmailUseCase());
    gh.lazySingleton<_i4.SharedPreferencesDatasource>(
        () => _i4.SharedPreferencesDatasource(gh<_i5.SharedPreferences>()));
    gh.factory<_i6.SignInUseCase>(
        () => _i6.SignInUseCase(gh<_i4.SharedPreferencesDatasource>()));
    gh.factory<_i7.SignUpUseCase>(
        () => _i7.SignUpUseCase(gh<_i4.SharedPreferencesDatasource>()));
    gh.factory<_i8.CheckAuthStatusUseCase>(() =>
        _i8.CheckAuthStatusUseCase(gh<_i4.SharedPreferencesDatasource>()));
    gh.factory<_i9.LogOutUseCase>(
        () => _i9.LogOutUseCase(gh<_i4.SharedPreferencesDatasource>()));
    gh.factory<_i10.SearchCubit>(
        () => _i10.SearchCubit(gh<_i3.SearchUsersByEmailUseCase>()));
    gh.factory<_i11.AuthCubit>(() => _i11.AuthCubit(
          gh<_i7.SignUpUseCase>(),
          gh<_i6.SignInUseCase>(),
          gh<_i8.CheckAuthStatusUseCase>(),
        ));
    gh.factory<_i12.HomeCubit>(() => _i12.HomeCubit(gh<_i9.LogOutUseCase>()));
    return this;
  }
}
