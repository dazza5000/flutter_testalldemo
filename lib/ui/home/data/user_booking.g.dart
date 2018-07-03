// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBooking _$UserBookingFromJson(Map<String, dynamic> json) {
  return new UserBooking(
      json['pagination'] == null
          ? null
          : new Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : new Booking.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$UserBookingSerializerMixin {
  Pagination get pagination;
  List<Booking> get data;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'pagination': pagination, 'data': data};
}
