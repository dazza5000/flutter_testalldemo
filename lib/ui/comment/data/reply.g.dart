// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) {
  return new Reply(
      json['id'] as int,
      json['image'] as String,
      json['user'] as int,
      json['username'] as String,
      json['mesg'] as String,
      json['review'] as int,
      json['doctorId'] as int,
      json['doctor'] as String,
      json['articleId'] as int,
      json['article'] as String,
      json['comment'] as int,
      json['mention'] as int,
      json['mentionName'] as String,
      json['canDelete'] as bool,
      json['createDate'],
      json['timeAgo']);
}

abstract class _$ReplySerializerMixin {
  int get id;
  String get image;
  int get user;
  String get username;
  String get mesg;
  int get review;
  int get doctorId;
  String get doctor;
  int get articleId;
  String get article;
  int get comment;
  int get mention;
  String get mentionName;
  bool get canDelete;
  dynamic get createDate;
  dynamic get timeAgo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'image': image,
        'user': user,
        'username': username,
        'mesg': mesg,
        'review': review,
        'doctorId': doctorId,
        'doctor': doctor,
        'articleId': articleId,
        'article': article,
        'comment': comment,
        'mention': mention,
        'mentionName': mentionName,
        'canDelete': canDelete,
        'createDate': createDate,
        'timeAgo': timeAgo
      };
}
