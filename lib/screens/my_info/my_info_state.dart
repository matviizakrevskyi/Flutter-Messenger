import 'package:flutter_messenger/domain/user.dart';

class MyInfoState {
  final User? user;
  final MyInfoStage stage;
  final double animationOpacity;

  MyInfoState(this.user, this.stage, this.animationOpacity);

  MyInfoState copyWith({User? user, MyInfoStage? stage, double? animationOpacity}) => MyInfoState(
      user ?? this.user, stage ?? this.stage, animationOpacity ?? this.animationOpacity);
}

enum MyInfoStage { defaultStage, editing }
