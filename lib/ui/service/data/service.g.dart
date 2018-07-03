// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return new Service(
      json['id'] as int, json['name'] as String, json['image'] as String);
}

abstract class _$ServiceSerializerMixin {
  int get id;
  String get name;
  String get image;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'name': name, 'image': image};
}
