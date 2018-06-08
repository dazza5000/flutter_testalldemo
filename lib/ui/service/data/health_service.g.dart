// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_service.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

HealthService _$HealthServiceFromJson(Map<String, dynamic> json) {
  return new HealthService(
      json['service'] == null
          ? null
          : new Service.fromJson(json['service'] as Map<String, dynamic>),
      (json['subservice'] as List)
          ?.map((e) => e == null
              ? null
              : new SubService.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$HealthServiceSerializerMixin {
  Service get service;
  List<SubService> get subservice;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'service': service, 'subservice': subservice};
}
