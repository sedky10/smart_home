import 'package:flutter/material.dart';
import 'package:smart_home/features/Login/presentation/views/widgets/custom_otp_text_form.dart';

class VerificationCodeRow extends StatelessWidget {
  const VerificationCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController1 = TextEditingController();
    TextEditingController otpController2 = TextEditingController();
    TextEditingController otpController3 = TextEditingController();
    TextEditingController otpController4 = TextEditingController();
    TextEditingController otpController5 = TextEditingController();
    TextEditingController otpController6 = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OtpTextFormField(
            controller: otpController1, havePrevious: false, autoFocus: true),
        OtpTextFormField(
          controller: otpController2,
        ),
        OtpTextFormField(
          controller: otpController3,
        ),
        OtpTextFormField(
          controller: otpController4,
        ),
        OtpTextFormField(
          controller: otpController5,
        ),
        OtpTextFormField(controller: otpController6, haveNext: false),
      ],
    );
  }
}
