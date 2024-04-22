import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/my_info/my_info_state.dart';
import 'package:flutter_messenger/usecases/get_user_data_stream.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyInfoCubit extends Cubit<MyInfoState> {
  final GetUserDataStreamUseCase _getUserDataStream;

  late StreamSubscription _subscription;

  MyInfoCubit(this._getUserDataStream) : super(MyInfoState(null)) {
    _subscription = _getUserDataStream.execute().listen((event) {
      emit(state.copyWith(user: event));
    });
  }

  changeProfileData() {
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
