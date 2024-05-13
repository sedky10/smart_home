import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/function/toast.dart';
import 'package:smart_home/core/helper/image_assets.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/features/Register/presentation/manager/register/register_user_cubit.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/head_view.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/register_dialoge.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/register_item.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/user_data.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterUserCubit, RegisterUserState>(
      listener: (context, state) {
        if (state is RegisterUserSuccess) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const RegisterDialoge(),
          );
          showToast('Account created successfully');
        } else if (state is RegisterUserFailed) {
          showToast('failed');
        } else if (state is RegisterUserLoading) {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterUserLoading,
          progressIndicator: const CircularProgressIndicator(
            color: ColorStyles.lightblue,
          ),
          child: Scaffold(
            backgroundColor: ColorStyles.blackLight,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ImageItem(
                      image: ImagesAssets.registerImage,
                    ),
                    UserData(),
                    Registeritem(),
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
