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
      json['image'] as String,
      json['status'] as int,
      json['customMesg'] as String,
      json['time'] as String,
      json['rawtime'],
      json['createDate'],
      json['timeAgo']);
}

abstract class _$BookingSerializerMixin {
  int get id;
  int get doctor;
  String get doctorName;
  String get image;
  int get status;
  String get customMesg;
  String get time;
  dynamic get rawtime;
  dynamic get createDate;
  dynamic get timeAgo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'doctor': doctor,
        'doctorName': doctorName,
        'image': image,
        'status': status,
        'customMesg': customMesg,
        'time': time,
        'rawtime': rawtime,
        'createDate': createDate,
        'timeAgo': timeAgo
      };
}
