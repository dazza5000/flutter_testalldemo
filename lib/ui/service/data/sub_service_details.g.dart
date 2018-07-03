// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_service_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubServiceDetails _$SubServiceDetailsFromJson(Map<String, dynamic> json) {
  return new SubServiceDetails(
      json['id'] as int,
      json['name'] as String,
      json['desc'] as String,
      json['image'] as String,
      json['shareUrl'] as String);
}

abstract class _$SubServiceDetailsSerializerMixin {
  int get id;
  String get name;
  String get desc;
  String get image;
  String get shareUrl;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'desc': desc,
        'image': image,
        'shareUrl': shareUrl
      };
}
