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
  Icon(Icons.water_damage, color: Colors.lightBlue, size: 60.sp),
  Icon(Icons.motion_photos_on, color: Colors.lightBlue, size: 60.sp),
  Icon(Icons.smoke_free, color: Colors.lightBlue, size: 60.sp),
];
List<Map<String, dynamic>> rooms = [
  {
    'name': 'BedRoom',
    'image': roomsImages[0],
    'sensors': [
      {
        'name': 'Humidity',
        'icon': sensorsIcons[1],
        'value': false,
      },
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': false,
      },
      {
        'name': 'Smoke',
        'icon': sensorsIcons[3],
        'value': false,
      },
    ],
  },
  {
    'name': 'Kids Room',
    'image': roomsImages[1],
    'sensors': [
      {
        'name': 'Humidity',
        'icon': sensorsIcons[1],
        'value': false,
      },
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': false,
      },
      {
        'name': 'Smoke',
        'icon': sensorsIcons[3],
        'value': false,
      },
    ],
  },
  {
    'name': 'Living Room',
    'image': roomsImages[2],
    'sensors': [
      {
        'name': 'Humidity',
        'icon': sensorsIcons[1],
        'value': false,
      },
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': false,
      },
      {
        'name': 'Smoke',
        'icon': sensorsIcons[3],
        'value': false,
      },
    ],
  },
  {
    'name': 'kitchen',
    'image': roomsImages[3],
    'sensors': [
      {
        'name': 'Temperature',
        'icon': sensorsIcons[0],
        'value': false,
      },
      {
        'name': 'Humidity',
        'icon': sensorsIcons[1],
        'value': false,
      },
      {
        'name': 'Motion',
        'icon': sensorsIcons[2],
        'value': false,
      },
      {
        'name': 'Smoke',
        'icon': sensorsIcons[3],
        'value': false,
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
      },
      {
        'name': 'Smoke',
        'icon': sensorsIcons[3],
        'value': false,
      },
    ],
  },
];



