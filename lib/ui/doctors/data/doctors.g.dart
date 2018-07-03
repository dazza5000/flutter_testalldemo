// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctors _$DoctorsFromJson(Map<String, dynamic> json) {
  return new Doctors(
      json['pagination'] == null
          ? null
          : new Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : new Doctor.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$DoctorsSerializerMixin {
  Pagination get pagination;
  List<Doctor> get doctor;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'pagination': pagination, 'data': doctor};
}
