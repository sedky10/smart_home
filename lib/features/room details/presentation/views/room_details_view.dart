import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/sensors_data.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';

class RoomDetailsView extends StatelessWidget {
  const RoomDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyles.blackLight,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorStyles.blackLight,
          title: Text(
            context.read<SwitchCubit>().roomName,
            style: TextStyles.font18WhiteBold,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30.sp,
              color: ColorStyles.grey,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Hero(
                  tag: roomsImages[context.read<SwitchCubit>().roomIndex],
                  child: Image.asset(
                    roomsImages[context.read<SwitchCubit>().roomIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'All Devices',
                    style: TextStyles.font18WhiteMedium,
                  ),
                )
                    .animate()
                    .fadeIn(
                      duration: 800.milliseconds,
                      curve: Curves.easeIn,
                    )
                    .moveX(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: context.read<SwitchCubit>().roomSensors(),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(bottom: 10.h),
                      clipBehavior: Clip.hardEdge,
                      elevation: 5,
                      color: ColorStyles.blackLight,
                      shadowColor: ColorStyles.black,
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                context.read<SwitchCubit>().roomsData[context
                                    .read<SwitchCubit>()
                                    .roomIndex]['sensors'][index]['icon'],
                                Text(
                                  context.read<SwitchCubit>().roomsData[context
                                      .read<SwitchCubit>()
                                      .roomIndex]['sensors'][index]['name'],
                                  style: TextStyles.font14GreyMedium,
                                ),
                              ],
                            ),
                            BlocBuilder<SwitchCubit, SwitchState>(
                              builder: (context, state) {
                                return Switch(
                                  inactiveTrackColor: ColorStyles.darkGrey,
                                  activeTrackColor: ColorStyles.lightblue,
                                  value: context.read<SwitchCubit>().roomsData[
                                          context.read<SwitchCubit>().roomIndex]
                                      ['sensors'][index]['value'],
                                  onChanged: (val) {
                                    BlocProvider.of<SwitchCubit>(context)
                                        .switchValue(
                                      val,
                                      index,
                                      false,
                                      context.read<SwitchCubit>().roomName,
                                      context.read<SwitchCubit>().roomIndex,
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
                    .animate()
                    .fadeIn(
                      duration: 800.milliseconds,
                      curve: Curves.easeIn,
                    )
                    .moveX(),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all( 30.sp),
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorStyles.lightblue,
            child: Icon(
              Icons.mic,
              size: 30.sp,
            ),
          ),
        ));
  }
}
