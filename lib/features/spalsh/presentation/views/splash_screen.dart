import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/image_assets.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward(from: 0.0);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 3000),
        () {
          if (_auth.currentUser != null) {
            GoRouter.of(context).pushReplacement(AppRoutes.kNavigationView);
          } else {
            GoRouter.of(context).pushReplacement(AppRoutes.kOnBoardingView);
          }
        },
      ),
      builder: (context, snapshot) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ColorStyles.white,
            child: FadeTransition(
              opacity: _animation,
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagesAssets.appLogo,
                      width: MediaQuery.of(context).size.width-50,
                      height: MediaQuery.of(context).size.height/3,
                    ),
                   
                    Text(
                      'Smart Home',
                      style: TextStyle(
                        color: ColorStyles.lightblue,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
