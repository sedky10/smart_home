part of 'register_user_cubit.dart';

sealed class RegisterUserState extends Equatable {
  const RegisterUserState();

  @override
  List<Object> get props => [];
}

final class RegisterUserInitial extends RegisterUserState {}
final class RegisterUserLoading extends RegisterUserState {}
final class RegisterUserFailed extends RegisterUserState {}
final class RegisterUserSuccess extends RegisterUserState {}
