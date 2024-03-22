// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_messenger/screens/auth/auth_cubit.dart' as _i6;
import 'package:flutter_messenger/screens/home/home_cubit.dart' as _i7;
import 'package:flutter_messenger/usecases/log_out.dart' as _i3;
import 'package:flutter_messenger/usecases/sign_in.dart' as _i4;
import 'package:flutter_messenger/usecases/sign_up.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.factory<_i3.LogOutUseCase>(() => _i3.LogOutUseCase());
    gh.factory<_i4.SignInUseCase>(() => _i4.SignInUseCase());
    gh.factory<_i5.SignUpUseCase>(() => _i5.SignUpUseCase());
    gh.factory<_i6.AuthCubit>(() => _i6.AuthCubit(
          gh<_i5.SignUpUseCase>(),
          gh<_i4.SignInUseCase>(),
        ));
    gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit(gh<_i3.LogOutUseCase>()));
    return this;
  }
}
