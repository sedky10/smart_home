import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/helper/service_locator.dart';
import 'package:smart_home/core/routing/app_router.dart';
import 'package:smart_home/core/utils/app_theme.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';
import 'package:smart_home/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const SmartHome());
}

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SwitchCubit>(
            create: (context) => SwitchCubit(),
          ),
          // BlocProvider<SensorSwitchCubit>(
          //   create: (context) => SensorSwitchCubit(),
          // ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          theme: theme,
        ),
      ),
    );
  }
}
