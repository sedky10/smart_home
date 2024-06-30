import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_home/core/helper/constants.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => _firestore;
  Future<User?> signUp(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> logIn(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  Future addUserData(String firstName, String lastName, String phoneNumber,
      String email) async {
    try {
      await _firestore.collection(userCollection).add({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  // Future<void> sendPhoneNumberOtp(
  //   String phone,
  //   Function(PhoneAuthCredential) verificationCompleted,
  //   Function(FirebaseAuthException) verificationFailed,
  //   void Function(String, int?) codeSent,
  // ) async {
  //   try {
  //     _auth.verifyPhoneNumber(
  //       verificationCompleted: verificationCompleted,
  //       verificationFailed: verificationFailed,
  //       codeSent: codeSent,
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //       phoneNumber: '+20$phone',
  //     );
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> verifieyregisterEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<bool> checkVerifiedEmail() async {
    try {
      await _auth.currentUser!.reload();
      if (_auth.currentUser!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser!.delete();
      await _firestore
          .collection(userCollection)
          .where('email', isEqualTo: _auth.currentUser!.email)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          _firestore.collection(userCollection).doc(element.id).delete();
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> editProfile(String userName, String phoneNumber, String email,
      String lastName) async {
    try {
      final user = _auth.currentUser;

      await _firestore
          .collection(userCollection)
          .where('email', isEqualTo: user!.email)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          _firestore.collection(userCollection).doc(element.id).update({
            'firstName': userName,
            'phoneNumber': phoneNumber,
            'email': email,
            'lastName': lastName,
          });
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}
