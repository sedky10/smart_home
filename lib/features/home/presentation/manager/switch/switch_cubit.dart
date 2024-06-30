import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:smart_home/core/helper/function/toast.dart';
import 'package:smart_home/core/helper/sensors_data.dart';
part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());
  List<Map<String, dynamic>> get roomsData => rooms;
  String roomName = '';
  int roomIndex = 0;

  switchValue(bool val, int index, bool home, String roomNName, int roomIIndex,
      BluetoothConnection _connection) {
    emit(SwitchInitial());
    if (home) {
      roomsData[getRoomIndexBySensorIndex(roomIIndex)]['sensors']
          [getSensorIndexInRoomBySensorIndex(index)]['value'] = val;
      sendChar(
        val
            ? roomsData[getRoomIndexBySensorIndex(roomIIndex)]['sensors']
                [getSensorIndexInRoomBySensorIndex(index)]['Opencode']
            : roomsData[getRoomIndexBySensorIndex(roomIIndex)]['sensors']
                [getSensorIndexInRoomBySensorIndex(index)]['Closecode'],
        _connection,
      );
    } else {
      roomsData[roomIIndex]['sensors'][index]['value'] = val;
      val
          ? sendChar(
              roomsData[roomIIndex]['sensors'][index]['Opencode'], _connection)
          : sendChar(roomsData[roomIIndex]['sensors'][index]['Closecode'],
              _connection);
    }
    emit(SwitchChange());
  }

  int? allSensors() {
    int totalSensors = 0;

    for (var room in rooms) {
      List rooms = room['sensors'];
      totalSensors = rooms.length + totalSensors;
    }

    print('Total number of sensors: $totalSensors');
    return totalSensors;
  }

  int? roomSensors() {
    return rooms[roomIndex]['sensors'].length;
  }

  String getSensorNameByIndex(int index) {
    List<Map<String, dynamic>> allSensors = [];
    for (var room in rooms) {
      allSensors.addAll(room['sensors']);
    }
    return allSensors[index]['name'];
  }

  String? getRoomNameBySensorIndex(int index) {
    int currentIndex = 0;
    for (var room in rooms) {
      int sensorsCount = room['sensors'].length;
      if (currentIndex + sensorsCount > index) {
        return room['name'];
      }
      currentIndex += sensorsCount;
    }
    return null; // Return null if index is out of bounds
  }

  dynamic getSensorValueByIndex(int index) {
    List<Map<String, dynamic>> allSensors = [];
    for (var room in rooms) {
      allSensors.addAll(room['sensors']);
    }
    return allSensors[index]['value'];
  }

  int getRoomIndexBySensorIndex(int sensorIndex) {
    int totalSensorsCounted = 0;

    for (int roomIndexxxx = 0; roomIndexxxx < rooms.length; roomIndexxxx++) {
      int sensorsCount = rooms[roomIndexxxx]['sensors'].length;

      if (sensorIndex < totalSensorsCounted + sensorsCount) {
        return roomIndexxxx;
      }

      totalSensorsCounted += sensorsCount;
    }

    throw RangeError('Sensor index out of range');
  }

  int getSensorIndexInRoomBySensorIndex(int sensorIndex) {
    int totalSensorsCounted = 0;

    for (int roomIndex = 0; roomIndex < rooms.length; roomIndex++) {
      int sensorsCount = rooms[roomIndex]['sensors'].length;

      if (sensorIndex < totalSensorsCounted + sensorsCount) {
        return sensorIndex - totalSensorsCounted;
      }

      totalSensorsCounted += sensorsCount;
    }

    throw RangeError('Sensor index out of range');
  }

  void sendChar(String char, BluetoothConnection _connection) async {
    if (_connection.isConnected) {
      try {
        _connection.output.add(Uint8List.fromList(utf8.encode(char)));
        await _connection.output.allSent;

        showToast('sensor value changed');
      } catch (e) {
        showToast(e.toString());
      }
    } else {
      showToast('No active connection');
    }
  }
}
