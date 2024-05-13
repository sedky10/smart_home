import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';

class Listeddevicesitem extends StatelessWidget {
  const Listeddevicesitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All devices',
                style: TextStyles.font18WhiteMedium,
              ),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.zero,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'see all',
                  style: TextStyles.font14GreyMedium,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10.h),
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  color: ColorStyles.blackLight,
                  shadowColor: ColorStyles.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BlocProvider<SwitchCubit>(
                      create: (context) => SwitchCubit(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'Smoke Detector',
                                  style: TextStyles.font18WhiteMedium,
                                ),
                              ),
                              Text(
                                'Living Room',
                                style: TextStyles.font14GreyMedium,
                              ),
                            ],
                          ),
                          BlocBuilder<SwitchCubit, SwitchState>(
                            builder: (context, state) {
                              return Switch(
                                inactiveTrackColor: ColorStyles.darkGrey,
                                activeTrackColor: ColorStyles.lightblue,
                                value: context.read<SwitchCubit>().value,
                                onChanged: (val) {
                                  BlocProvider.of<SwitchCubit>(context)
                                      .switchValue(val);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
