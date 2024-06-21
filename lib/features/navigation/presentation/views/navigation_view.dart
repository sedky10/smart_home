import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/account/presentation/manager/profile%20data/profile_data_cubit.dart';
import 'package:smart_home/features/account/presentation/views/account_view.dart';
import 'package:smart_home/features/home/presentation/manager/switch/switch_cubit.dart';
import 'package:smart_home/features/home/presentation/views/home_view.dart';
import 'package:smart_home/features/navigation/presentation/manager/cubit/navigation_cubit.dart';
import 'package:smart_home/features/rooms/presenation/views/rooms.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late final List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': const Homeview(), 'title': 'home'},
      {'page': const RoomsView(), 'title': 'Connection'},
      {'page': const AccountView(), 'title': 'Profile'},
    ];
    BlocProvider.of<ProfileDataCubit>(context).getProfileData();
    check();
    super.initState();
  }

  check() async {
    PermissionStatus bluetoothStatus = await Permission.bluetoothScan.request();
    if (bluetoothStatus.isGranted) {
      // Either the permission was already granted before or the user just granted it.
      openBlue();
    }
  }

  openBlue() async {
    // first, check if bluetooth is supported by your hardware
// Note: The platform is initialized on the first call to any FlutterBluePlus method.
    if (await FlutterBluePlus.isSupported == false) {
      print("Bluetooth not supported by this device");
      return;
    }

// handle bluetooth on & off
// note: for iOS the initial state is typically BluetoothAdapterState.unknown
// note: if you have permissions issues you will get stuck at BluetoothAdapterState.unauthorized
    var subscription =
        FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      print(state);
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
      } else {
        // show an error to the user, etc
      }
    });

// turn on bluetooth ourself if we can
// for iOS, the user controls bluetooth enable/disable
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

// cancel to prevent duplicate listeners
    subscription.cancel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    BlocProvider.of<NavigationCubit>(context).updateSelectedIndex(0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorStyles.blackLight,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            backgroundColor: ColorStyles.blackLight,
            leading: const SizedBox(),
            title: Text(
              'Smart Home',
              style: TextStyles.font18WhiteBold,
            )
                .animate()
                .fadeIn(
                  duration: 800.milliseconds,
                  curve: Curves.easeIn,
                )
                .moveY(),
          ),
          body: Center(
            child:
                _pages[BlocProvider.of<NavigationCubit>(context).selectedIndex]
                    ["page"], //New
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            child: BottomNavigationBar(
              backgroundColor: ColorStyles.black,
              selectedItemColor: ColorStyles.white,
              elevation: 0,
              unselectedItemColor: ColorStyles.grey.withOpacity(.5),
              selectedLabelStyle: TextStyles.font12GreyBold,
              unselectedLabelStyle: TextStyles.font12GreyBold,
              currentIndex:
                  BlocProvider.of<NavigationCubit>(context).selectedIndex,
              onTap: (index) {
                context.read<SwitchCubit>().allSensors();
                BlocProvider.of<ProfileDataCubit>(context).getProfileData();
                BlocProvider.of<NavigationCubit>(context)
                    .updateSelectedIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  label: 'home',
                  icon: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Icon(
                      BlocProvider.of<NavigationCubit>(context).selectedIndex ==
                              0
                          ? Icons.home
                          : Icons.home_outlined,
                      size: 30.sp,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Connection',
                  icon: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Icon(
                      BlocProvider.of<NavigationCubit>(context).selectedIndex ==
                              1
                          ? FontAwesomeIcons.bluetoothB
                          : FontAwesomeIcons.bluetoothB,
                      size: 30.sp,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Icon(
                      BlocProvider.of<NavigationCubit>(context).selectedIndex ==
                              2
                          ? FontAwesomeIcons.solidUser
                          : FontAwesomeIcons.user,
                      size: 30.sp,
                    ),
                  ),
                ),
              ],
              // selectedFontSize: 12,
              // unselectedFontSize: 12,
            ),
          ),
        );
      },
    );
  }
}
