part of 'password_eye_cubit.dart';

sealed class PasswordEyeState extends Equatable {
  const PasswordEyeState();

  @override
  List<Object> get props => [];
}

final class PasswordEyeInitial extends PasswordEyeState {}
final class PasswordEyeChanged extends PasswordEyeState {}
