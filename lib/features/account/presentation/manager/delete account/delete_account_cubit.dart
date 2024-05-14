import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_home/core/networking/firebase_services.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this._auth) : super(DeleteAccountInitial());
  final FirebaseServices _auth ;

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    try {
      await _auth.deleteAccount();
      emit(DeleteAccountSuccess());
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(DeleteAccountFailed());
    }
  }
}
