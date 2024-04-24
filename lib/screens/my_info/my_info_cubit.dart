import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/screens/my_info/my_info_state.dart';
import 'package:flutter_messenger/styling/styling.dart';
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

  int currentAvatarColorIndex = 0;

  MyInfoCubit(this._getUserDataStream, this._logOutUseCase, this._changeUserDataUseCase)
      : super(MyInfoState(true, null, MyInfoStage.defaultStage, 1, false, 0)) {
    _subscription = _getUserDataStream.execute().listen((event) {
      emit(state.copyWith(user: event, isLoading: false));
      if (event != null) {
        currentAvatarColorIndex = CustomColors.avatarColors.indexOf(event.avatarColor);
      }
    });
    nameController.addListener(() {
      _checkIsButtonActive();
    });
  }

  //default stage
  toChangingData() async {
    emit(state.copyWith(animationOpacity: 0));

    Timer(const Duration(milliseconds: 10), () {
      final user = state.user;
      if (user != null) {
        emit(state.copyWith(
            stage: MyInfoStage.editing,
            animationOpacity: 1,
            selectedColorIndex: currentAvatarColorIndex));
        nameController.text = user.name;
      } else {
        emit(state.copyWith(animationOpacity: 1));
      }
    });
  }

  popupCancel() {
    navigatorKey.currentState?.pop();
  }

  logOutConfirm() async {
    await _logOutUseCase.execute();
    navigatorKey.currentState?.pushReplacementNamed("/");
  }
  //

  //editing stage
  toDefaultStage() async {
    emit(state.copyWith(animationOpacity: 0));

    Timer(const Duration(milliseconds: 10), () {
      emit(state.copyWith(stage: MyInfoStage.defaultStage, animationOpacity: 1));
      nameController.text = '';
    });
  }

  selectColor(int index) {
    emit(state.copyWith(selectedColorIndex: index));
    _checkIsButtonActive();
  }

  _checkIsButtonActive() {
    final bool isNameChanged = nameController.text != state.user?.name;
    final bool isColorChanged = currentAvatarColorIndex != state.selectedColorIndex;
    final bool isActive = (isNameChanged || isColorChanged) && nameController.text.length > 1;
    emit(state.copyWith(isEditingButtonActive: isActive));
  }

  changeUserData() async {
    final user = state.user;
    if (user == null) {
      return;
    }

    if (nameController.text.length > 1) {
      emit(state.copyWith(isLoading: true));
      await _changeUserDataUseCase.execute(user.copyWith(
          name: nameController.text,
          avatarColor: CustomColors.avatarColors[state.selectedColorIndex]));
      emit(state.copyWith(stage: MyInfoStage.defaultStage));
    } else {
      emit(state.copyWith(nameErrorText: "Name must contain more than 1 character"));
    }
  }
  //

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
