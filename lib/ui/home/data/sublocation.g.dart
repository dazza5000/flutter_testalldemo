// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sublocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubLocation _$SubLocationFromJson(Map<String, dynamic> json) {
  return new SubLocation(json['id'] as int, json['name'] as String,
      json['location'] as int, json['order'] as int);
}

abstract class _$SubLocationSerializerMixin {
  int get id;
  String get name;
  int get location;
  int get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'location': location,
        'order': order
      };
}
