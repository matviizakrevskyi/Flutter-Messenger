import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/screens/my_info/my_info_state.dart';
import 'package:flutter_messenger/usecases/get_user_data_stream.dart';
import 'package:flutter_messenger/usecases/log_out.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyInfoCubit extends Cubit<MyInfoState> {
  final GetUserDataStreamUseCase _getUserDataStream;
  final LogOutUseCase _logOutUseCase;

  final TextEditingController nameController = TextEditingController();

  late StreamSubscription _subscription;

  MyInfoCubit(this._getUserDataStream, this._logOutUseCase)
      : super(MyInfoState(null, MyInfoStage.defaultStage, 1)) {
    _subscription = _getUserDataStream.execute().listen((event) {
      emit(state.copyWith(user: event));
      nameController.text = event?.name ?? "";
    });
  }

  //default stage
  toChangingData() async {
    emit(state.copyWith(animationOpacity: 0));

    Timer(const Duration(milliseconds: 10), () {
      emit(state.copyWith(stage: MyInfoStage.editing, animationOpacity: 1));
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

  changeProfileData() {}

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
