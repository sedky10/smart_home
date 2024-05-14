import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/features/Login/presentation/manager/login%20confirmation/login_confirm_user_cubit.dart';
import 'package:smart_home/features/Login/presentation/views/widgets/custom_otp_text_form.dart';

class VerificationCodeRow extends StatelessWidget {
  const VerificationCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ConfirmLoginUserCubit>().formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OtpTextFormField(
              controller: context.read<ConfirmLoginUserCubit>().otpController1,
              havePrevious: false,
              autoFocus: true),
          OtpTextFormField(
            controller: context.read<ConfirmLoginUserCubit>().otpController2,
          ),
          OtpTextFormField(
            controller: context.read<ConfirmLoginUserCubit>().otpController3,
          ),
          OtpTextFormField(
            controller: context.read<ConfirmLoginUserCubit>().otpController4,
          ),
          OtpTextFormField(
            controller: context.read<ConfirmLoginUserCubit>().otpController5,
          ),
          OtpTextFormField(
              controller: context.read<ConfirmLoginUserCubit>().otpController6,
              haveNext: false),
        ],
      ),
    );
  }
}
