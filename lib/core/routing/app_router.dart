import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/service_locator.dart';
import 'package:smart_home/core/networking/firebase_services.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/features/Login/presentation/manager/login%20confirmation/login_confirm_user_cubit.dart';
import 'package:smart_home/features/Login/presentation/manager/login/login_user_cubit.dart';
import 'package:smart_home/features/Login/presentation/manager/password%20eye/password_eye_login_cubit.dart';
import 'package:smart_home/features/Login/presentation/views/login_view.dart';
import 'package:smart_home/features/Login/presentation/views/login_confirmation.dart';
import 'package:smart_home/features/Register/presentation/manager/password%20confirm/password_confirm_cubit.dart';
import 'package:smart_home/features/Register/presentation/manager/password%20eye/password_eye_cubit.dart';
import 'package:smart_home/features/Register/presentation/manager/register/register_user_cubit.dart';
import 'package:smart_home/features/Register/presentation/views/register_view.dart';
import 'package:smart_home/features/account/presentation/manager/profile%20data/profile_data_cubit.dart';
import 'package:smart_home/features/navigation/presentation/manager/cubit/navigation_cubit.dart';
import 'package:smart_home/features/navigation/presentation/views/navigation_view.dart';
import 'package:smart_home/features/onBoarding/presentation/views/boarding_view.dart';
import 'package:smart_home/features/room%20details/presentation/views/room_details_view.dart';
import 'package:smart_home/features/spalsh/presentation/views/splash_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kOnBoardingView,
        builder: (BuildContext context, GoRouterState state) =>
            const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.kControllerView,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (BuildContext context, GoRouterState state) =>
            MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RegisterUserCubit(getIt<FirebaseServices>()),
            ),
            BlocProvider(
              create: (context) => PasswordEyeCubit(),
            ),
            BlocProvider(
              create: (context) => PasswordConfirmCubit(),
            ),
          ],
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kLoginView,
        builder: (BuildContext context, GoRouterState state) =>
            MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginUserCubit(getIt<FirebaseServices>()),
            ),
            BlocProvider(
              create: (context) => PasswordEyeLoginCubit(),
            ),
          ],
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kConfirmationLoginView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => ConfirmLoginUserCubit(getIt<FirebaseServices>()),
          child: const LoginConfirmation(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kNavigationView,
        builder: (BuildContext context, GoRouterState state) =>
            MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(
              create: (context) => getIt<NavigationCubit>(),
            ),
            BlocProvider(
              create: (context) => ProfileDataCubit(getIt<FirebaseServices>()),
            ),
          ],
          child: const NavigationView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kRoomDetailsView,
        builder: (BuildContext context, GoRouterState state) =>
            const RoomDetailsView(),
      ),
    ],
  );
}
