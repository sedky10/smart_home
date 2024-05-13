import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/helper/validators.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/widgets/custom_text_field.dart';
import 'package:smart_home/features/Register/presentation/manager/register/register_user_cubit.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterUserCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30.w,
                child: CustomTextField(
                  fillColor: ColorStyles.darkGrey,
                  focusedBorderColor: ColorStyles.darkGrey,
                  hintText: 'First Name',
                  validator: (val) {
                    return validateField(val!, 'First Name');
                  },
                  controller:
                      context.read<RegisterUserCubit>().firstNameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30.w,
                child: CustomTextField(
                  hintText: 'Last Name',
                  validator: (val) {
                    return validateField(val!, 'Last Name');
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  controller:
                      context.read<RegisterUserCubit>().lastNameController,
                  fillColor: ColorStyles.darkGrey,
                  focusedBorderColor: ColorStyles.darkGrey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            validator: (val) {
              return validateEmail(val!);
            },
            fillColor: ColorStyles.darkGrey,
            focusedBorderColor: ColorStyles.darkGrey,
            hintText: 'Email',
            controller: context.read<RegisterUserCubit>().emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            fillColor: ColorStyles.darkGrey,
            focusedBorderColor: ColorStyles.darkGrey,
            hintText: 'Password',
            validator: (val) {
              return validatePassword(val!);
            },
            controller: context.read<RegisterUserCubit>().passwordController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            fillColor: ColorStyles.darkGrey,
            focusedBorderColor: ColorStyles.darkGrey,
            hintText: ' Confirm Password',
            validator: (val) {
              return validatePassword(val!);
            },
            controller:
                context.read<RegisterUserCubit>().confirmPasswordController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
