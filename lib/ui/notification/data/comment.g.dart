// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return new Comment(
      json['id'] as int,
      json['user'] as String,
      json['userId'] as int,
      json['image'] as String,
      json['mesg'] as String,
      json['type'] as int,
      json['article'] as String,
      json['articleId'] as int,
      json['createDate'],
      json['timeAgo']);
}

abstract class _$CommentSerializerMixin {
  int get id;
  String get user;
  int get userId;
  String get image;
  String get mesg;
  int get type;
  String get article;
  int get articleId;
  dynamic get createDate;
  dynamic get timeAgo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user': user,
        'userId': userId,
        'image': image,
        'mesg': mesg,
        'type': type,
        'article': article,
        'articleId': articleId,
        'createDate': createDate,
        'timeAgo': timeAgo
      };
}
