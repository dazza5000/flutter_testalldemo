// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorProfile _$DoctorProfileFromJson(Map<String, dynamic> json) {
  return new DoctorProfile(
      json['doctor'] == null
          ? null
          : new Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      json['activeBooking'] == null
          ? null
          : new ActiveBooking.fromJson(
              json['activeBooking'] as Map<String, dynamic>))
    ..booking = (json['booking'] as List)
        ?.map((e) =>
            e == null ? null : new Booking.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..reviews = json['reviews'] == null
        ? null
        : new Comment.fromJson(json['reviews'] as Map<String, dynamic>);
}

abstract class _$DoctorProfileSerializerMixin {
  Doctor get doctor;
  ActiveBooking get activeBooking;
  List<Booking> get booking;
  Comment get reviews;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'doctor': doctor,
        'activeBooking': activeBooking,
        'booking': booking,
        'reviews': reviews
      };
}
