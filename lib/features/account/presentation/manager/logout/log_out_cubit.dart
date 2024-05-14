import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/core/networking/firebase_services.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this._auth) : super(LogOutInitial());
  final FirebaseServices _auth;

  Future<void> logOut() async {
    emit(LogOutLoading());
    try {
      await _auth.logOut();
      emit(LogOutSuccess());
    } on Exception catch (e) {
      emit(LogOutFailed(e.toString()));
    }
  }
}
