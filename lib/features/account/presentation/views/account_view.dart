import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/features/account/presentation/manager/profile%20data/profile_data_cubit.dart';
import 'package:smart_home/features/account/presentation/views/widgets/error_view.dart';
import 'package:smart_home/features/account/presentation/views/widgets/profile_actions.dart';
import 'package:smart_home/features/account/presentation/views/widgets/profile_view.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.blackLight,
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: BlocBuilder<ProfileDataCubit, ProfileDataState>(
          builder: (context, state) {
            if (state is ProfileDataError) {
              return const ErrorView();
            } else if (state is ProfileDataWaiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileDataLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ProfileView(
                      userName: '${state.firstName} ${state.lastName}',
                      phoneNumber: state.phoneNumber,
                      email: state.email,
                    ),
                    ProfileActions(
                      firstName: state.firstName,
                      lastName: state.lastName,
                      phoneNumber: state.phoneNumber,
                      email: state.email,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
