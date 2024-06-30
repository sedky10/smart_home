import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/rooms/presenation/manager/bluetooth%20connection/bluetooth_connection_cubit.dart';
import 'package:smart_home/features/rooms/presenation/manager/connect%20device/connect_device_cubit.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.blackLight,
      body: SizedBox(
        child: BlocBuilder<ConnectDeviceCubit, ConnectDeviceState>(
          builder: (context, state) {
            if (state is ConnectDeviceSuccess) {
              return Scaffold(
                backgroundColor: ColorStyles.blackLight,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text('you\'are Connected to A device',
                            style: TextStyles.font18WhiteMedium)),
                    SizedBox(height: 20.0.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorStyles.red),
                      child:
                          Text('Disconnect', style: TextStyles.font14WhiteBold),
                      onPressed: () {
                        BlocProvider.of<ConnectDeviceCubit>(context)
                            .disconnectDevice();
                      },
                    ),
                  ],
                ),
              );
            }
            return Scaffold(
              backgroundColor: ColorStyles.blackLight,
              appBar: AppBar(
                backgroundColor: ColorStyles.blackLight,
                title: Text('Scan Device', style: TextStyles.font18WhiteMedium),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                    child: BlocBuilder<BluetoothConnectionCubit,
                        BluetoothConnectionSState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: state is BluetoothScanning
                                  ? ColorStyles.blue
                                  : ColorStyles.red),
                          onPressed: state is BluetoothScanning
                              ? null
                              : () async {
                                  PermissionStatus bluetoothStatus =
                                      await Permission.bluetoothScan.request();
                                  if (bluetoothStatus.isGranted) {
                                    context
                                        .read<BluetoothConnectionCubit>()
                                        .startScan();
                                    // Either the permission was already granted before or the user just granted it.
                                  }
                                },
                          child: Text(
                            state is BluetoothScanning
                                ? 'Scanning...'
                                : 'Start Scan',
                            style: TextStyles.font14WhiteBold,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              body: SizedBox(
                child: BlocBuilder<BluetoothConnectionCubit,
                    BluetoothConnectionSState>(
                  builder: (context, state) {
                    if (state is BluetoothScanning) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: ColorStyles.lightblue,
                      ));
                    } else if (state is BluetoothScanError) {
                      return Center(
                        child: Text('error', style: TextStyles.font14WhiteBold),
                      );
                    } else if (state is BluetoothScanComplete) {
                      return Column(
                        children: [
                          context
                                  .read<BluetoothConnectionCubit>()
                                  .results
                                  .isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: context
                                        .read<BluetoothConnectionCubit>()
                                        .results
                                        .length,
                                    itemBuilder: (context, index) {
                                      final result = context
                                          .read<BluetoothConnectionCubit>()
                                          .results[index];
                                      return Padding(
                                        padding: EdgeInsets.all(padding),
                                        child: ListTile(
                                          title: Text(
                                            result.device.name.toString(),
                                            style: TextStyles.font14WhiteBold,
                                          ),
                                          subtitle: Text(
                                            result.device.address.toString() ??
                                                'Unknown',
                                            style: TextStyles.font14GreyMedium,
                                          ),
                                          // leading: const Icon(
                                          //   FontAwesomeIcons.bluetooth,
                                          //   color: ColorStyles.white,
                                          // ),
                                          trailing: BlocBuilder<
                                              ConnectDeviceCubit,
                                              ConnectDeviceState>(
                                            builder: (context, state) {
                                              return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: state
                                                            is ConnectDeviceWaiting
                                                        ? ColorStyles.darkGrey
                                                        : ColorStyles.blue),
                                                onPressed: state
                                                        is ConnectDeviceWaiting
                                                    ? null
                                                    : () {
                                                        BlocProvider.of<
                                                                    ConnectDeviceCubit>(
                                                                context)
                                                            .connectDevice(
                                                                result.device);
                                                      },
                                                child: Text(
                                                  state is ConnectDeviceWaiting
                                                      ? 'connecting..'
                                                      : 'connect',
                                                  style:
                                                      TextStyles.font14WhiteBold,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.bluetooth,
                                    size: 100.0.sp,
                                    color: ColorStyles.lightblue,
                                  ),
                                  SizedBox(height: 30.0.h),
                                  Center(
                                    child: Text(
                                      'No devices found.......',
                                      style: TextStyles.font20WhiteMedium,
                                    ),
                                  ),
                                  SizedBox(height: 50.0.h),
                                ],
                              )
                        ],
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.bluetooth,
                          size: 100.0.sp,
                          color: ColorStyles.darkGrey,
                        ),
                        SizedBox(height: 30.0.h),
                        Center(
                          child: Text(
                            'start Scan to Find Devices',
                            style: TextStyles.font20WhiteMedium,
                          ),
                        ),
                        SizedBox(height: 50.0.h),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
