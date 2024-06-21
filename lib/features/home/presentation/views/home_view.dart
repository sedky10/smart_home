import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/features/home/presentation/views/widgets/listed_devices.dart';
import 'package:smart_home/features/home/presentation/views/widgets/listed_rooms.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.blackLight,
      body: Column(
        children: [
          const ListedroomsItem(),
          SizedBox(
            height: 20.h,
          ),
          const Expanded(
            child: Listeddevicesitem(),
          ),
        ],
      ),
    );
  }
}
