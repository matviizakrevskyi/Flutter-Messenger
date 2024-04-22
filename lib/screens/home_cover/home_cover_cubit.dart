import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/home_cover/home_cover_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCoverCubit extends Cubit<HomeCoverState> {
  HomeCoverCubit() : super(HomeCoverState(HomeStage.home));

  onHome() {
    emit(state.copyWith(stage: HomeStage.home));
  }

  onInfo() {
    emit(state.copyWith(stage: HomeStage.info));
  }
}
