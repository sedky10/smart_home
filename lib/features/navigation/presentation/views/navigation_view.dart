import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/account/presentation/manager/profile%20data/profile_data_cubit.dart';
import 'package:smart_home/features/account/presentation/views/account_view.dart';
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
      {'page': const RoomsView(), 'title': 'Rooms'},
      {'page': const AccountView(), 'title': 'Profile'},
    ];
    BlocProvider.of<ProfileDataCubit>(context).getProfileData();

    super.initState();
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
            ),
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
              currentIndex: state is NavigationInitial
                  ? 0
                  : BlocProvider.of<NavigationCubit>(context).selectedIndex,
              onTap: (index) {
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
                  label: 'Rooms',
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
