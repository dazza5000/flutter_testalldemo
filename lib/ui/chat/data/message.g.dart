// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return new Message(
      json['id'] as int,
      json['mesg'] as String,
      json['mesgType'] as String,
      json['image'] == null
          ? null
          : new Image.fromJson(json['image'] as Map<String, dynamic>),
      json['adminIcon'] as String,
      json['reply'] as bool,
      json['date'] as String,
      json['time'] as String,
      json['rawTime'],
      json['timeAgo']);
}

abstract class _$MessageSerializerMixin {
  int get id;
  String get mesg;
  String get mesgType;
  Image get image;
  String get adminIcon;
  bool get reply;
  String get date;
  String get time;
  dynamic get rawTime;
  dynamic get timeAgo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'mesg': mesg,
        'mesgType': mesgType,
        'image': image,
        'adminIcon': adminIcon,
        'reply': reply,
        'date': date,
        'time': time,
        'rawTime': rawTime,
        'timeAgo': timeAgo
      };
}
