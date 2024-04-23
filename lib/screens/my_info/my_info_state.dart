import 'package:flutter_messenger/domain/user.dart';

class MyInfoState {
  final User? user;
  final MyInfoStage stage;
  final double animationOpacity;
  final String nameErrorText;

  MyInfoState(this.user, this.stage, this.animationOpacity, this.nameErrorText);

  MyInfoState copyWith(
          {User? user, MyInfoStage? stage, double? animationOpacity, String? nameErrorText}) =>
      MyInfoState(user ?? this.user, stage ?? this.stage, animationOpacity ?? this.animationOpacity,
          nameErrorText ?? this.nameErrorText);
}

enum MyInfoStage { defaultStage, editing }
