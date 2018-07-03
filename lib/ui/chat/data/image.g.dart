// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return new Image(json['thumb'] as String, json['small'] as String,
      json['original'] as String);
}

abstract class _$ImageSerializerMixin {
  String get thumb;
  String get small;
  String get original;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'thumb': thumb, 'small': small, 'original': original};
}
