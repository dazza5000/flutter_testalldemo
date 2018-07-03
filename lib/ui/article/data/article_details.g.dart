// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDetails _$ArticleDetailsFromJson(Map<String, dynamic> json) {
  return new ArticleDetails(
      json['article'] == null
          ? null
          : new Article.fromJson(json['article'] as Map<String, dynamic>),
      json['comment'] == null
          ? null
          : new Comment.fromJson(json['comment'] as Map<String, dynamic>));
}

abstract class _$ArticleDetailsSerializerMixin {
  Article get article;
  Comment get comment;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'article': article, 'comment': comment};
}
