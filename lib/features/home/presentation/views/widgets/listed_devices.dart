import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';
import 'package:smart_home/features/rooms/presenation/manager/connect%20device/connect_device_cubit.dart';

class Listeddevicesitem extends StatelessWidget {
  const Listeddevicesitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All devices',
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
              itemCount: context.read<SwitchCubit>().allSensors(),
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10.h),
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  color: ColorStyles.blackLight,
                  shadowColor: ColorStyles.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                context
                                    .read<SwitchCubit>()
                                    .getSensorNameByIndex(index),
                                style: TextStyles.font18WhiteMedium,
                              ),
                            ),
                            Text(
                              context
                                  .read<SwitchCubit>()
                                  .getRoomNameBySensorIndex(index)!,
                              style: TextStyles.font14GreyMedium,
                            ),
                          ],
                        ),
                        BlocBuilder<SwitchCubit, SwitchState>(
                          builder: (context, state) {
                            return Switch(
                              inactiveTrackColor: ColorStyles.darkGrey,
                              activeTrackColor: ColorStyles.lightblue,
                              value: context
                                  .read<SwitchCubit>()
                                  .getSensorValueByIndex(index),
                              onChanged: (val) {
                                BlocProvider.of<SwitchCubit>(context)
                                    .switchValue(
                                  val,
                                  index,
                                  true,
                                  context
                                      .read<SwitchCubit>()
                                      .getRoomNameBySensorIndex(index)!,
                                  index,
                                  context.read<ConnectDeviceCubit>().connection,
                                );
                              },
                            );
                          },
                        ),
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
          )
        ],
      ),
    );
  }
}
