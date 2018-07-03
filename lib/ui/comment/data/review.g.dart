// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return new Review(
      json['id'] as int,
      json['image'] as String,
      json['user'] as int,
      json['username'] as String,
      json['doctor'] as int,
      json['article'] as int,
      json['mesg'] as String,
      json['canDelete'] as bool,
      json['hasReply'] as bool,
      json['replyCount'] as int,
      json['createDate'],
      json['timeAgo']);
}

abstract class _$ReviewSerializerMixin {
  int get id;
  String get image;
  int get user;
  String get username;
  int get doctor;
  int get article;
  String get mesg;
  bool get canDelete;
  bool get hasReply;
  int get replyCount;
  dynamic get createDate;
  dynamic get timeAgo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'image': image,
        'user': user,
        'username': username,
        'doctor': doctor,
        'article': article,
        'mesg': mesg,
        'canDelete': canDelete,
        'hasReply': hasReply,
        'replyCount': replyCount,
        'createDate': createDate,
        'timeAgo': timeAgo
      };
}
