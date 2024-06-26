part of 'navigation_cubit.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

final class NavigationInitial extends NavigationState {}
final class NavigationLoading extends NavigationState {}

final class NavigationPages extends NavigationState {}
