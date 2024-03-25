// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_messenger/datasources/prefs_datasource.dart' as _i5;
import 'package:flutter_messenger/screens/auth/auth_cubit.dart' as _i12;
import 'package:flutter_messenger/screens/chat/chat_cubit.dart' as _i3;
import 'package:flutter_messenger/screens/home/home_cubit.dart' as _i13;
import 'package:flutter_messenger/screens/search/search_cubit.dart' as _i11;
import 'package:flutter_messenger/usecases/check_auth_status.dart' as _i9;
import 'package:flutter_messenger/usecases/log_out.dart' as _i10;
import 'package:flutter_messenger/usecases/search_users_by_email.dart' as _i4;
import 'package:flutter_messenger/usecases/sign_in.dart' as _i7;
import 'package:flutter_messenger/usecases/sign_up.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    gh.factory<_i3.ChatCubit>(() => _i3.ChatCubit());
    gh.factory<_i4.SearchUsersByEmailUseCase>(
        () => _i4.SearchUsersByEmailUseCase());
    gh.lazySingleton<_i5.SharedPreferencesDatasource>(
        () => _i5.SharedPreferencesDatasource(gh<_i6.SharedPreferences>()));
    gh.factory<_i7.SignInUseCase>(
        () => _i7.SignInUseCase(gh<_i5.SharedPreferencesDatasource>()));
    gh.factory<_i8.SignUpUseCase>(
        () => _i8.SignUpUseCase(gh<_i5.SharedPreferencesDatasource>()));
    gh.factory<_i9.CheckAuthStatusUseCase>(() =>
        _i9.CheckAuthStatusUseCase(gh<_i5.SharedPreferencesDatasource>()));
    gh.factory<_i10.LogOutUseCase>(
        () => _i10.LogOutUseCase(gh<_i5.SharedPreferencesDatasource>()));
    gh.factory<_i11.SearchCubit>(
        () => _i11.SearchCubit(gh<_i4.SearchUsersByEmailUseCase>()));
    gh.factory<_i12.AuthCubit>(() => _i12.AuthCubit(
          gh<_i8.SignUpUseCase>(),
          gh<_i7.SignInUseCase>(),
          gh<_i9.CheckAuthStatusUseCase>(),
        ));
    gh.factory<_i13.HomeCubit>(() => _i13.HomeCubit(gh<_i10.LogOutUseCase>()));
    return this;
  }
}
