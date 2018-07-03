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
      json['user'] as String,
      json['userId'] as int,
      json['image'] as String,
      json['mesg'] as String,
      json['doctor'] as String,
      json['doctorId'] as int,
      json['createDate'],
      json['timeAgo']);
}

abstract class _$ReviewSerializerMixin {
  int get id;
  String get user;
  int get userId;
  String get image;
  String get mesg;
  String get doctor;
  int get doctorId;
  dynamic get createDate;
  dynamic get timeAgo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user': user,
        'userId': userId,
        'image': image,
        'mesg': mesg,
        'doctor': doctor,
        'doctorId': doctorId,
        'createDate': createDate,
        'timeAgo': timeAgo
      };
}
