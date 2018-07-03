// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Save _$SaveFromJson(Map<String, dynamic> json) {
  return new Save(
      json['article'] == null
          ? null
          : new SavedArticle.fromJson(json['article'] as Map<String, dynamic>),
      json['doctor'] == null
          ? null
          : new SavedDoctor.fromJson(json['doctor'] as Map<String, dynamic>));
}

abstract class _$SaveSerializerMixin {
  SavedArticle get article;
  SavedDoctor get doctor;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'article': article, 'doctor': doctor};
}
