import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/service_locator.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/features/Login/presentation/views/login_view.dart';
import 'package:smart_home/features/Login/presentation/views/login_confirmation.dart';
import 'package:smart_home/features/Register/presentation/views/register_view.dart';
import 'package:smart_home/features/navigation/presentation/manager/cubit/navigation_cubit.dart';
import 'package:smart_home/features/navigation/presentation/views/navigation_view.dart';
import 'package:smart_home/features/onBoarding/presentation/views/boarding_view.dart';
import 'package:smart_home/features/room%20details/presentation/views/room_details_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.kOnBoardingView,
        builder: (BuildContext context, GoRouterState state) =>
            const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.kRegisterView,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.kLoginView,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.kConfirmationLoginView,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginConfirmation(),
      ),
      GoRoute(
        path: AppRoutes.kNavigationView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider<NavigationCubit>(
          create: (context) => getIt<NavigationCubit>(),
          child: const NavigationView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kRoomDetailsView,
        builder: (BuildContext context, GoRouterState state) => const RoomDetailsView(),
      ),
    ],
  );
}
