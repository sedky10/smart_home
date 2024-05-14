// class UserModel {
//   final String lastName;
//   final String email;
//   final String firstName;
//   final String phoneNumber;

//   UserModel({
//     required this.lastName,
//     required this.email,
//     required this.firstName,
//     required this.phoneNumber,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       lastName: json['lastName'],
//       email: json['email'],
//       firstName: json['firstName'],
//       phoneNumber: json['photoUrl'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'lastName': lastName,
//       'email': email,
//       'firstName': firstName,
//       'phoneNumber': phoneNumber,
//     };
//   }
// }