// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return new Address(json['address'] as String,
      (json['lat'] as num)?.toDouble(), (json['lng'] as num)?.toDouble());
}

abstract class _$AddressSerializerMixin {
  String get address;
  double get lat;
  double get lng;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'address': address, 'lat': lat, 'lng': lng};
}
