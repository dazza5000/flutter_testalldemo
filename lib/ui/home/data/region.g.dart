// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return new Region(
      json['title'] as String,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : new SubLocation.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$RegionSerializerMixin {
  String get title;
  List<SubLocation> get items;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'items': items};
}
