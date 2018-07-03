// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return new Article(
      json['id'] as int,
      json['title'] as String,
      json['type'] as int,
      json['image'] as String,
      json['video'] as String,
      json['content'] as String,
      json['category'] as int,
      json['commentCount'] as int,
      json['categoryName'] as String,
      json['fav'] as bool,
      json['favCount'] as int,
      json['share'] as int,
      json['save'] as bool,
      json['shareUrl'] as String);
}

abstract class _$ArticleSerializerMixin {
  int get id;
  String get title;
  int get type;
  String get image;
  String get video;
  String get content;
  int get category;
  int get commentCount;
  String get categoryName;
  bool get fav;
  int get favCount;
  int get share;
  bool get save;
  String get shareUrl;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'type': type,
        'image': image,
        'video': video,
        'content': content,
        'category': category,
        'commentCount': commentCount,
        'categoryName': categoryName,
        'fav': fav,
        'favCount': favCount,
        'share': share,
        'save': save,
        'shareUrl': shareUrl
      };
}
