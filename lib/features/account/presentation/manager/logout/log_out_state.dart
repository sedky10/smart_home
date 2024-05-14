part of 'log_out_cubit.dart';

sealed class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object> get props => [];
}

final class LogOutInitial extends LogOutState {}
final class LogOutSuccess extends LogOutState {}
final class LogOutFailed extends LogOutState {
  final String message;

  const LogOutFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class LogOutLoading extends LogOutState {}
