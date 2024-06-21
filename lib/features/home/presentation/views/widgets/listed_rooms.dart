import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/sensors_data.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';

class ListedroomsItem extends StatelessWidget {
  const ListedroomsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Rooms',
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            itemCount: context.read<SwitchCubit>().roomsData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              List sensors =
                  context.read<SwitchCubit>().roomsData[index]['sensors'];
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<SwitchCubit>(context).roomName =
                      context.read<SwitchCubit>().roomsData[index]['name'];
                  BlocProvider.of<SwitchCubit>(context).roomIndex = index;
                  GoRouter.of(context).push(AppRoutes.kRoomDetailsView);
                },
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  color: ColorStyles.blackLight,
                  shadowColor: ColorStyles.black,
                  child: Column(
                    children: [
                      Hero(
                        tag: roomsImages[index],
                        child: Image.asset(
                          roomsImages[index],
                          fit: BoxFit.cover,
                          height: 100.h,
                          width: 130.w,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.read<SwitchCubit>().roomsData[index]
                                  ['name'],
                              style: TextStyles.font14WhiteMedium,
                            ),
                            Text(
                              '${sensors.length} lights',
                              style: TextStyles.font14GreyMedium,
                            ),
                          ],
                        ),
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
              .moveY(),
        ),
      ],
    );
  }
}
