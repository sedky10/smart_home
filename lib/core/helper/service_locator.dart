import 'package:get_it/get_it.dart';
import 'package:smart_home/core/networking/firebase_services.dart';
import 'package:smart_home/features/Register/presentation/manager/register/register_user_cubit.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';
import 'package:smart_home/features/navigation/presentation/manager/cubit/navigation_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<NavigationCubit>(NavigationCubit());
  getIt.registerSingleton<SwitchCubit>(SwitchCubit());
  getIt.registerSingleton<RegisterUserCubit>(RegisterUserCubit(getIt<FirebaseServices>()));
}
