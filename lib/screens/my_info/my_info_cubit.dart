import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/screens/my_info/my_info_state.dart';
import 'package:flutter_messenger/usecases/userdata/change_user_data.dart';
import 'package:flutter_messenger/usecases/userdata/get_user_data_stream.dart';
import 'package:flutter_messenger/usecases/auth/log_out.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyInfoCubit extends Cubit<MyInfoState> {
  final ChangeUserDataUseCase _changeUserDataUseCase;
  final GetUserDataStreamUseCase _getUserDataStream;
  final LogOutUseCase _logOutUseCase;

  final TextEditingController nameController = TextEditingController();

  late StreamSubscription _subscription;

  MyInfoCubit(this._getUserDataStream, this._logOutUseCase, this._changeUserDataUseCase)
      : super(MyInfoState(null, MyInfoStage.defaultStage, 1, '')) {
    _subscription = _getUserDataStream.execute().listen((event) {
      emit(state.copyWith(user: event));
    });
  }

  //default stage
  toChangingData() async {
    emit(state.copyWith(animationOpacity: 0));

    Timer(const Duration(milliseconds: 10), () {
      emit(state.copyWith(stage: MyInfoStage.editing, animationOpacity: 1));
      nameController.text = state.user?.name ?? "";
    });
  }

  logOut() async {
    await _logOutUseCase.execute();

    navigatorKey.currentState?.pushReplacementNamed("/");
  }

  //editing stage
  toDefaultStage() async {
    emit(state.copyWith(animationOpacity: 0));

    Timer(const Duration(milliseconds: 10), () {
      emit(state.copyWith(stage: MyInfoStage.defaultStage, animationOpacity: 1));
      nameController.text = '';
    });
  }

  changeUserData() async {
    final user = state.user;
    if (user == null) {
      return;
    }

    if (nameController.text.length > 1) {
      await _changeUserDataUseCase.execute(user.copyWith(name: nameController.text));
      emit(state.copyWith(stage: MyInfoStage.defaultStage));
    } else {
      emit(state.copyWith(nameErrorText: "Name must contain more than 1 character"));
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
