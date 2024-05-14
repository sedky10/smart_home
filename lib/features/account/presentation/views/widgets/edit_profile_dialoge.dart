import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_home/core/helper/function/toast.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custom_text_field.dart';
import 'package:smart_home/core/widgets/custome_button.dart';
import 'package:smart_home/features/account/presentation/manager/edit%20profile/edit_profile_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/profile%20data/profile_data_cubit.dart';

class EditProfileDialoge extends StatelessWidget {
  const EditProfileDialoge(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email});
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          GoRouter.of(context).pop();
        } else if (state is EditProfileFailed) {
          showToast('Failed to edit profile');
        }
      },
      builder: (context, state) {
        context.read<EditProfileCubit>().firstNameController.text = firstName;
        context.read<EditProfileCubit>().lastNameController.text = lastName;
        context.read<EditProfileCubit>().phoneNumberController.text =
            phoneNumber;
        context.read<EditProfileCubit>().emailController.text = email;
        return ModalProgressHUD(
          inAsyncCall: state is EditProfileLoading,
          progressIndicator: const CircularProgressIndicator(),
          child: AlertDialog(
            backgroundColor: ColorStyles.blackLight,
            content: Form(
              key: context.read<EditProfileCubit>().formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyles.font18WhiteBold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    fillColor: ColorStyles.darkGrey,
                    focusedBorderColor: ColorStyles.darkGrey,
                    hintText: context
                        .read<EditProfileCubit>()
                        .firstNameController
                        .text,
                    textInputAction: TextInputAction.next,
                    hintStyle: TextStyles.font14GreyMedium,
                    keyboardType: TextInputType.name,
                    onChanged: (p0) => context
                        .read<EditProfileCubit>()
                        .firstNameController
                        .text = p0,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    fillColor: ColorStyles.darkGrey,
                    focusedBorderColor: ColorStyles.darkGrey,
                    hintText: context
                        .read<EditProfileCubit>()
                        .lastNameController
                        .text,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    hintStyle: TextStyles.font14GreyMedium,
                    onChanged: (p0) => context
                        .read<EditProfileCubit>()
                        .lastNameController
                        .text = p0,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    fillColor: ColorStyles.darkGrey,
                    focusedBorderColor: ColorStyles.darkGrey,
                    hintText: context
                        .read<EditProfileCubit>()
                        .phoneNumberController
                        .text,
                    textInputAction: TextInputAction.next,
                    validator: (p0) {
                      if (p0!.isNotEmpty) {
                        if (!RegExp(r'^(002)?01[0125][0-9]{8}$').hasMatch(p0)) {
                          showToast(
                            'please enter a valid phone number',
                          );
                          return 'please enter a valid phone number';
                        }
                      }
                      return null;
                    },
                    hintStyle: TextStyles.font14GreyMedium,
                    keyboardType: TextInputType.number,
                    onChanged: (p0) => context
                        .read<EditProfileCubit>()
                        .phoneNumberController
                        .text = p0,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    fillColor: ColorStyles.darkGrey,
                    focusedBorderColor: ColorStyles.darkGrey,
                    hintText:
                        context.read<EditProfileCubit>().emailController.text,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) {
                      if (p0!.isNotEmpty) {
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(p0)) {
                          showToast(
                            'please enter a valid email',
                          );
                          return 'please enter a valid email';
                        }
                      }
                      return null;
                    },
                    hintStyle: TextStyles.font14GreyMedium,
                    onChanged: (p0) => context
                        .read<EditProfileCubit>()
                        .emailController
                        .text = p0,
                  ),
                ],
              ),
            ),
            actions: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButton(
                  title: 'Done',
                  buttonmainColor: ColorStyles.lightblue,
                  onPressed: () {
                    context.read<EditProfileCubit>().editProfile();
                    BlocProvider.of<ProfileDataCubit>(context).getProfileData();
                  },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButton(
                  title: 'cancel',
                  buttonmainColor: ColorStyles.grey,
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
