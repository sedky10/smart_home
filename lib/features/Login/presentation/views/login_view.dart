import 'package:flutter/material.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/image_assets.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/features/Login/presentation/views/widgets/login_item.dart';
import 'package:smart_home/features/Login/presentation/views/widgets/user_login_data.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/head_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.blackLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ImageItem(
                image: ImagesAssets.loginImage,
              ),
              UserLoginData(),
              LoginItem(),
            ],
          ),
        ),
      ),
    );
  }
}
