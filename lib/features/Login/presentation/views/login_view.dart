import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/function/toast.dart';
import 'package:smart_home/core/helper/image_assets.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/features/Login/presentation/manager/login/login_user_cubit.dart';
import 'package:smart_home/features/Login/presentation/views/widgets/login_item.dart';
import 'package:smart_home/features/Login/presentation/views/widgets/user_login_data.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/head_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginUserState>(
        listener: (context, state) {
      if (state is LoginUserSuccess) {
        showToast('Loged in successfully');
        GoRouter.of(context).go(AppRoutes.kNavigationView);
      } else if (state is LoginUserFailed) {
        showToast(state.message);
      } else if (state is LoginUserLoading) {
        const CircularProgressIndicator();
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: ColorStyles.lightblue,
        ),
        inAsyncCall: state is LoginUserLoading,
        child: Scaffold(
          backgroundColor: ColorStyles.blackLight,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const ImageItem(
                    image: ImagesAssets.loginImage,
                    title: 'Welcome Back!',
                  ),
                  const UserLoginData()
                      .animate()
                      .fadeIn(
                        duration: 800.milliseconds,
                        curve: Curves.easeIn,
                      )
                      .moveX(),
                  const LoginItem()
                      .animate()
                      .fadeIn(
                        duration: 800.milliseconds,
                        curve: Curves.easeIn,
                      )
                      .moveY(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
