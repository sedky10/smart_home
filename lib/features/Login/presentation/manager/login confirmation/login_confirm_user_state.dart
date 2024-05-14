part of 'login_confirm_user_cubit.dart';

sealed class ConfirmLoginUserState extends Equatable {
  const ConfirmLoginUserState();

  @override
  List<Object> get props => [];
}

final class ConfirmLoginUserInitial extends ConfirmLoginUserState {}
final class ConfirmLoginUserLoading extends ConfirmLoginUserState {}
final class ConfirmLoginUserFailed extends ConfirmLoginUserState {}
final class ConfirmLoginUserSuccess extends ConfirmLoginUserState {}
