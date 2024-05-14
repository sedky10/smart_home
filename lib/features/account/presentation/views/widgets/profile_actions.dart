import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_home/core/helper/function/toast.dart';
import 'package:smart_home/core/helper/service_locator.dart';
import 'package:smart_home/core/networking/firebase_services.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custome_button.dart';
import 'package:smart_home/features/account/presentation/manager/delete%20account/delete_account_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/edit%20profile/edit_profile_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/logout/log_out_cubit.dart';
import 'package:smart_home/features/account/presentation/manager/profile%20data/profile_data_cubit.dart';
import 'package:smart_home/features/account/presentation/views/widgets/edit_profile_dialoge.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions(
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          CustomButton(
            title: 'Edit Profile',
            buttonmainColor: ColorStyles.darkGrey,
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) {
                          return EditProfileCubit(getIt<FirebaseServices>());
                        },
                      ),
                      BlocProvider(
                        create: (context) =>
                            ProfileDataCubit(getIt<FirebaseServices>()),
                      ),
                    ],
                    child: EditProfileDialoge(
                      firstName: firstName,
                      lastName: lastName,
                      phoneNumber: phoneNumber,
                      email: email,
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            title: 'LogOut',
            buttonmainColor: ColorStyles.grey,
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => LogOutCubit(getIt<FirebaseServices>()),
                    child: BlocConsumer<LogOutCubit, LogOutState>(
                      listener: (context, state) {
                        if (state is LogOutSuccess) {
                          GoRouter.of(context).pop();
                          GoRouter.of(context)
                              .pushReplacement(AppRoutes.kNavigationView);
                          Future.delayed(const Duration(seconds: 1));
                          GoRouter.of(context)
                              .pushReplacement(AppRoutes.kLoginView);
                        } else if (state is LogOutFailed) {
                          GoRouter.of(context).pop();
                          showToast(state.message);
                        } else if (state is LogOutLoading) {
                          const CircularProgressIndicator();
                        }
                      },
                      builder: (context, state) {
                        return ModalProgressHUD(
                          inAsyncCall: state is LogOutLoading,
                          progressIndicator: const CircularProgressIndicator(
                            color: ColorStyles.lightblue,
                          ),
                          child: AlertDialog(
                            backgroundColor: ColorStyles.blackLight,
                            title: const Icon(
                              Icons.logout,
                              color: ColorStyles.red,
                              size: 50,
                            ),
                            content: Text(
                              'Are you sure you want to log out?',
                              style: TextStyles.font18WhiteMedium,
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              state is LogOutLoading
                                  ? const CircularProgressIndicator()
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: CustomButton(
                                        title: 'Out',
                                        buttonmainColor: ColorStyles.lightblue,
                                        onPressed: () {
                                          context.read<LogOutCubit>().logOut();
                                        },
                                      ),
                                    ),
                              SizedBox(
                                width: 10.w,
                              ),
                              state is LogOutLoading
                                  ? const SizedBox()
                                  : SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
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
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            title: 'Delete Account',
            buttonmainColor: ColorStyles.red,
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) =>
                        DeleteAccountCubit(getIt<FirebaseServices>()),
                    child: BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
                      builder: (context, state) {
                        return AlertDialog(
                          backgroundColor: ColorStyles.blackLight,
                          title: const Icon(
                            Icons.delete,
                            color: ColorStyles.red,
                            size: 50,
                          ),
                          content: Text(
                            'Are you sure you want to delete your account?',
                            style: TextStyles.font18WhiteMedium,
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            state is LogOutLoading
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: CustomButton(
                                      title: 'delete',
                                      buttonmainColor: ColorStyles.lightblue,
                                      onPressed: () async {
                                        await BlocProvider.of<
                                                DeleteAccountCubit>(context)
                                            .deleteAccount();
                                        GoRouter.of(context).pop();
                                        GoRouter.of(context).pushReplacement(
                                            AppRoutes.kRegisterView);
                                      },
                                    ),
                                  ),
                            SizedBox(
                              width: 10.w,
                            ),
                            state is LogOutLoading
                                ? const SizedBox()
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: CustomButton(
                                      title: 'cancel',
                                      buttonmainColor: ColorStyles.grey,
                                      onPressed: () {
                                        GoRouter.of(context).pop();
                                      },
                                    ),
                                  ),
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
