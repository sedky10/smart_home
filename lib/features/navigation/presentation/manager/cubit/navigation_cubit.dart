import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  int _selectedindex = 0;
 
  int get selectedIndex => _selectedindex;
 
  updateSelectedIndex(
    int index,
  ) {
    emit(NavigationLoading());
    _selectedindex = index;

    emit(NavigationPages());
  }
}
 