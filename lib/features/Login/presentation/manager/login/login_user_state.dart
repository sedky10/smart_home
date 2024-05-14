part of 'login_user_cubit.dart';

sealed class LoginUserState extends Equatable {
  const LoginUserState();

  @override
  List<Object> get props => [];
}

final class LoginUserInitial extends LoginUserState {}
final class LoginUserLoading extends LoginUserState {}
final class LoginUserFailed extends LoginUserState {
  final String message;
  const LoginUserFailed(this.message);
}
final class LoginUserSuccess extends LoginUserState {}
