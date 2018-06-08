// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return new Schedule(json['id'] as int, json['time'] as String,
      json['rawTime'], json['range'] as int, json['day'] as String);
}

abstract class _$ScheduleSerializerMixin {
  int get id;
  String get time;
  dynamic get rawTime;
  int get range;
  String get day;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'time': time,
        'rawTime': rawTime,
        'range': range,
        'day': day
      };
}
