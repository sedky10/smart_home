import 'package:get_it/get_it.dart';
import 'package:smart_home/core/networking/firebase_services.dart';
import 'package:smart_home/features/Login/presentation/manager/login%20confirmation/login_confirm_user_cubit.dart';
import 'package:smart_home/features/Login/presentation/manager/login/login_user_cubit.dart';
import 'package:smart_home/features/Login/presentation/manager/password%20eye/password_eye_login_cubit.dart';
import 'package:smart_home/features/Register/presentation/manager/password%20confirm/password_confirm_cubit.dart';
import 'package:smart_home/features/Register/presentation/manager/password%20eye/password_eye_cubit.dart';
import 'package:smart_home/features/Register/presentation/manager/register/register_user_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/delete%20account/delete_account_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/edit%20profile/edit_profile_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/logout/log_out_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/profile%20data/profile_data_cubit.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';
import 'package:smart_home/features/navigation/presentation/manager/cubit/navigation_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<NavigationCubit>(NavigationCubit());
  getIt.registerSingleton<SwitchCubit>(SwitchCubit());
  // getIt.registerSingleton<SensorSwitchCubit>(SensorSwitchCubit());
  getIt.registerSingleton<PasswordEyeCubit>(PasswordEyeCubit());
  getIt.registerSingleton<PasswordEyeLoginCubit>(PasswordEyeLoginCubit());
  getIt.registerSingleton<EditProfileCubit>(EditProfileCubit(getIt<FirebaseServices>()));
  getIt.registerSingleton<DeleteAccountCubit>(DeleteAccountCubit(getIt<FirebaseServices>()));
  getIt.registerSingleton<LogOutCubit>(LogOutCubit(getIt<FirebaseServices>()));
  getIt.registerSingleton<PasswordConfirmCubit>(PasswordConfirmCubit());
  getIt.registerSingleton<RegisterUserCubit>(
      RegisterUserCubit(getIt<FirebaseServices>()));
  getIt.registerSingleton<LoginUserCubit>(
      LoginUserCubit(getIt<FirebaseServices>()));
  getIt.registerSingleton<ConfirmLoginUserCubit>(
      ConfirmLoginUserCubit(getIt<FirebaseServices>()));
  getIt.registerSingleton<ProfileDataCubit>(
      ProfileDataCubit(getIt<FirebaseServices>()));
}
