// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return new Data(
      json['id'] as int,
      json['commentreply'] == null
          ? null
          : new Comment.fromJson(json['commentreply'] as Map<String, dynamic>),
      json['reviewreply'] == null
          ? null
          : new Review.fromJson(json['reviewreply'] as Map<String, dynamic>),
      json['booking'] == null
          ? null
          : new Booking.fromJson(json['booking'] as Map<String, dynamic>),
      json['type'] as String);
}

abstract class _$DataSerializerMixin {
  int get id;
  Comment get commentreply;
  Review get reviewreply;
  Booking get booking;
  String get type;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'commentreply': commentreply,
        'reviewreply': reviewreply,
        'booking': booking,
        'type': type
      };
}
