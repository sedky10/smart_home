import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/helper/validators.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/widgets/custom_text_field.dart';
import 'package:smart_home/features/Login/presentation/manager/login/login_user_cubit.dart';
import 'package:smart_home/features/Login/presentation/manager/password%20eye/password_eye_login_cubit.dart';

class UserLoginData extends StatelessWidget {
  const UserLoginData({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginUserCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            fillColor: ColorStyles.darkGrey,
            focusedBorderColor: ColorStyles.darkGrey,
            hintText: 'Email',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return validateEmail(value!);
            },
            controller: context.read<LoginUserCubit>().emailController,
          ),
          SizedBox(
            height: 20.h,
          ),
           BlocBuilder<PasswordEyeLoginCubit, PasswordEyeLoginState>(
            builder: (context, state) {
              return CustomTextField(
                fillColor: ColorStyles.darkGrey,
                focusedBorderColor: ColorStyles.darkGrey,
                hintText: 'Password',
                validator: (val) {
                  return validatePassword(val!);
                },
                obscureText: context.read<PasswordEyeLoginCubit>().visible,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<PasswordEyeLoginCubit>().changeVisibility();
                  },
                  icon: Icon(
                    context.read<PasswordEyeLoginCubit>().visible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorStyles.grey,
                  ),
                ),
                controller:
                    context.read<LoginUserCubit>().passwordController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              );
            },
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
