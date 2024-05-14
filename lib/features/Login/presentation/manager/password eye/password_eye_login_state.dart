part of 'password_eye_login_cubit.dart';

sealed class PasswordEyeLoginState extends Equatable {
  const PasswordEyeLoginState();

  @override
  List<Object> get props => [];
}

final class PasswordEyeLoginInitial extends PasswordEyeLoginState {}
final class PasswordEyeLoginChanged extends PasswordEyeLoginState {}
