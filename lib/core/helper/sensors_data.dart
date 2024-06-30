import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/helper/image_assets.dart';

final List<String> roomsImages = [
  ImagesAssets.bedRoomImage,
  ImagesAssets.kidsRommImage,
  ImagesAssets.livingRoomImage,
  ImagesAssets.kitchenImage,
  ImagesAssets.garageImage,
];
final List<Icon> sensorsIcons = [
  Icon(Icons.thermostat, color: Colors.lightBlue, size: 60.sp),
  Icon(Icons.gas_meter, color: Colors.lightBlue, size: 60.sp),
  Icon(Icons.motion_photos_on, color: Colors.lightBlue, size: 60.sp),
  Icon(Icons.smoke_free, color: Colors.lightBlue, size: 60.sp),
  Icon(Icons.local_fire_department, color: Colors.lightBlue, size: 60.sp),
];

bool motionValue = false;
List<Map<String, dynamic>> rooms = [
  {
    'name': 'BedRoom',
    'image': roomsImages[0],
    'sensors': [
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': motionValue,
        'Opencode': 'o',
        'Closecode': 'f',
      },
    ],
  },
  {
    'name': 'Kids Room',
    'image': roomsImages[1],
    'sensors': [
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': motionValue,
        'Opencode': 'o',
        'Closecode': 'f',
      },
      {
        'name': 'Smoke',
        'icon': sensorsIcons[3],
        'value': false,
        'Opencode': 'a',
        'Closecode': 'z',
      },
    ],
  },
  {
    'name': 'Living Room',
    'image': roomsImages[2],
    'sensors': [
      {
        'name': 'Temperature',
        'icon': sensorsIcons[0],
        'value': false,
        'Opencode': 'm',
        'Closecode': 'l',
      },
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': motionValue,
        'Opencode': 'o',
        'Closecode': 'f',
      },
    ],
  },
  {
    'name': 'kitchen',
    'image': roomsImages[3],
    'sensors': [
      {
        'name': 'Fire',
        'icon': sensorsIcons[4],
        'value': false,
        'Opencode': 'a',
        'Closecode': 'z',
      },
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': motionValue,
        'Opencode': 'o',
        'Closecode': 'f',
      },
      {
        'name': 'Gas',
        'icon': sensorsIcons[1],
        'value': false,
        'Opencode': 'x',
        'Closecode': 'q',
      },
    ],
  },
  {
    'name': 'Garage',
    'image': roomsImages[4],
    'sensors': [
      {
        'name': 'Temperature',
        'icon': sensorsIcons[0],
        'value': false,
        'Opencode': 'o',
        'Closecode': 'f',
      },
      {
        'name': 'Smoke',
        'icon': sensorsIcons[3],
        'value': false,
        'Opencode': 'o',
        'Closecode': 'f',
      },
    ],
  },
];
