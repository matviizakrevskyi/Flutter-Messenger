import 'package:flutter_messenger/domain/user.dart';

class MyInfoState {
  final bool isLoading;
  final User? user;
  final MyInfoStage stage;
  final double animationOpacity;
  final bool isEditingButtonActive;
  final int selectedColorIndex;

  MyInfoState(this.isLoading, this.user, this.stage, this.animationOpacity,
      this.isEditingButtonActive, this.selectedColorIndex);

  MyInfoState copyWith(
          {bool? isLoading,
          User? user,
          MyInfoStage? stage,
          double? animationOpacity,
          String? nameErrorText,
          bool? isEditingButtonActive,
          int? selectedColorIndex}) =>
      MyInfoState(
          isLoading ?? this.isLoading,
          user ?? this.user,
          stage ?? this.stage,
          animationOpacity ?? this.animationOpacity,
          isEditingButtonActive ?? this.isEditingButtonActive,
          selectedColorIndex ?? this.selectedColorIndex);
}

enum MyInfoStage { defaultStage, editing }
