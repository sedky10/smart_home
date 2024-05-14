import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/networking/firebase_services.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit(this._firebaseAuth) : super(ProfileDataInitial());
  final FirebaseServices _firebaseAuth;
  String _firstName = '';
  String get firstName => _firstName;
  String _lastName = '';
  String get lastName => _lastName;
  String _email = '';
  String get email => _email;
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  void getProfileData() async {
    emit(ProfileDataWaiting());
    try {
      final user = _firebaseAuth.auth.currentUser;
      await _firebaseAuth.firestore
          .collection(userCollection)
          .where(
            'email',
            isEqualTo: user!.email,
          )
          .get()
          .then((value) {
        for (var element in value.docs) {
          _firstName = element['firstName'];
          _lastName = element['lastName'];
          _email = element['email'];
          _phoneNumber = element['phoneNumber'];
        }
      });

      emit(ProfileDataLoaded(
        email: _email,
        phoneNumber: _phoneNumber,
        firstName: _firstName,
        lastName: _lastName,
      ));
    } catch (e) {
      print(e);
      emit(ProfileDataError());
    }
  }
}
