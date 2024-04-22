import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/my_info/my_info_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyInfoCubit extends Cubit<MyInfoState> {
  MyInfoCubit() : super(MyInfoState(null));
}