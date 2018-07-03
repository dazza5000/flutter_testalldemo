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
      json['doctor'] as int,
      json['doctorName'] as String,
      json['status'] as String,
      json['customMesg'] as String,
      json['time'] as String,
      json['rawtime']);
}

abstract class _$BookingSerializerMixin {
  int get doctor;
  String get doctorName;
  String get status;
  String get customMesg;
  String get time;
  dynamic get rawtime;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'doctor': doctor,
        'doctorName': doctorName,
        'status': status,
        'customMesg': customMesg,
        'time': time,
        'rawtime': rawtime
      };
}
