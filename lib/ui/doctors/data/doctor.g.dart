// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return new Doctor(
      json['id'] as int,
      json['name'] as String,
      json['image'] as String,
      json['office'] as String,
      json['onDuty'] as bool,
      json['role'] as String,
      json['degree'] as String,
      (json['schedule'] as List)
          ?.map((e) => e == null
              ? null
              : new Schedule.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['fav'] as bool,
      json['favCount'] as int,
      json['share'] as int,
      json['shareUrl'] as String,
      json['save'] as bool,
      json['canReview'] as bool);
}

abstract class _$DoctorSerializerMixin {
  int get id;
  String get name;
  String get image;
  String get office;
  bool get onDuty;
  String get role;
  String get degree;
  List<Schedule> get schedule;
  bool get fav;
  int get favCount;
  int get share;
  String get shareUrl;
  bool get save;
  bool get canReview;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'image': image,
        'office': office,
        'onDuty': onDuty,
        'role': role,
        'degree': degree,
        'schedule': schedule,
        'fav': fav,
        'favCount': favCount,
        'share': share,
        'shareUrl': shareUrl,
        'save': save,
        'canReview': canReview
      };
}
