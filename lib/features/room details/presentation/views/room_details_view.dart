import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';

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
          'Bedroom ',
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
        padding:  EdgeInsets.all(padding),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 10.h),
              clipBehavior: Clip.hardEdge,
              elevation: 5,
              color: ColorStyles.blackLight,
              shadowColor: ColorStyles.black,
              child: Padding(
                padding:  EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                       Icon(Icons.sensors, color: ColorStyles.lightblue, size: 60.sp,),
                        Text(
                          'Sensor',
                          style: TextStyles.font14GreyMedium,
                        ),
                      ],
                    ),
                    Switch(
                      inactiveTrackColor: ColorStyles.darkGrey,
                      activeTrackColor: ColorStyles.lightblue,
                      value: true,
                      onChanged: (val) {},
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
