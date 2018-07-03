// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubService _$SubServiceFromJson(Map<String, dynamic> json) {
  return new SubService(json['id'] as int, json['name'] as String);
}

abstract class _$SubServiceSerializerMixin {
  int get id;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'name': name};
}
