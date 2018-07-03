// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveBooking _$ActiveBookingFromJson(Map<String, dynamic> json) {
  return new ActiveBooking(
      json['id'] as int,
      json['doctor'] as int,
      json['doctorName'] as String,
      json['status'] as int,
      json['time'] as String,
      json['rawtime']);
}

abstract class _$ActiveBookingSerializerMixin {
  int get id;
  int get doctor;
  String get doctorName;
  int get status;
  String get time;
  dynamic get rawtime;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'doctor': doctor,
        'doctorName': doctorName,
        'status': status,
        'time': time,
        'rawtime': rawtime
      };
}
