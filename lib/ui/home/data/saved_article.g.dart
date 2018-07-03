// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedArticle _$SavedArticleFromJson(Map<String, dynamic> json) {
  return new SavedArticle(
      json['fav'] as bool,
      json['save'] as bool,
      json['comment'] as bool,
      json['data'] == null
          ? null
          : new Article.fromJson(json['data'] as Map<String, dynamic>));
}

abstract class _$SavedArticleSerializerMixin {
  bool get fav;
  bool get save;
  bool get comment;
  Article get data;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'fav': fav,
        'save': save,
        'comment': comment,
        'data': data
      };
}
