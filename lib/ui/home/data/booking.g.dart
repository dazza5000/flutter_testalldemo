// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return new Booking(
      json['id'] as int,
      json['doctor'] as int,
      json['doctorName'] as String,
      json['status'] as int,
      json['customMesg'] as String,
      json['time'] as String,
      json['rawTime'] as bool);
}

abstract class _$BookingSerializerMixin {
  int get id;
  int get doctor;
  String get doctorName;
  int get status;
  String get customMesg;
  String get time;
  bool get rawTime;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('doctor', doctor);
    writeNotNull('doctorName', doctorName);
    writeNotNull('status', status);
    writeNotNull('customMesg', customMesg);
    writeNotNull('time', time);
    writeNotNull('rawTime', rawTime);
    return val;
  }
}
