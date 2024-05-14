part of 'delete_account_cubit.dart';

sealed class DeleteAccountState extends Equatable {
  const DeleteAccountState();

  @override
  List<Object> get props => [];
}

final class DeleteAccountInitial extends DeleteAccountState {}
final class DeleteAccountSuccess extends DeleteAccountState {}
final class DeleteAccountFailed extends DeleteAccountState {}
final class DeleteAccountLoading extends DeleteAccountState {}
