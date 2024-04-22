class HomeCoverState {
  final HomeStage stage;

  HomeCoverState(this.stage);

  HomeCoverState copyWith({HomeStage? stage}) => HomeCoverState(stage ?? this.stage);
}

enum HomeStage { home, info }
