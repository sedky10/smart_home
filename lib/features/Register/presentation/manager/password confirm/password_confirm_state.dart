part of 'password_confirm_cubit.dart';

sealed class PasswordConfirmState extends Equatable {
  const PasswordConfirmState();

  @override
  List<Object> get props => [];
}

final class PasswordConfirmInitial extends PasswordConfirmState {}
final class PasswordConfirmChanged extends PasswordConfirmState {}
