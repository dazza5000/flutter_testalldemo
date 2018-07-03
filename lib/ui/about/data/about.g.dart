// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) {
  return new About(json['featureImage'] as String, json['content'] as String);
}

abstract class _$AboutSerializerMixin {
  String get featureImage;
  String get content;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'featureImage': featureImage, 'content': content};
}
