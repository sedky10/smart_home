part of 'profile_data_cubit.dart';

sealed class ProfileDataState extends Equatable {
  const ProfileDataState();

  @override
  List<Object> get props => [];
}

final class ProfileDataInitial extends ProfileDataState {}
final class ProfileDataWaiting extends ProfileDataState {}
final class ProfileDataLoaded extends ProfileDataState {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;


  const ProfileDataLoaded({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [firstName, lastName, email, phoneNumber];
}
final class ProfileDataError extends ProfileDataState {}
