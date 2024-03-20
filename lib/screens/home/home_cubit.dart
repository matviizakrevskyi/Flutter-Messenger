import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  HomeCubit() : super(HomeState(false));
}
