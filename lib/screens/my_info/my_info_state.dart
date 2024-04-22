import 'package:flutter_messenger/domain/user.dart';

class MyInfoState {
  final User? user;

  MyInfoState(this.user);

  MyInfoState copyWith({User? user}) => MyInfoState(user ?? this.user);
}
