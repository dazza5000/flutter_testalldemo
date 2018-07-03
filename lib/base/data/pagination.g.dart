// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return new Pagination(json['from'] as int, json['total'] as int,
      json['currentPage'] as int, json['lastPage'] as int);
}

abstract class _$PaginationSerializerMixin {
  int get from;
  int get total;
  int get currentPage;
  int get lastPage;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('from', from);
    writeNotNull('total', total);
    writeNotNull('currentPage', currentPage);
    writeNotNull('lastPage', lastPage);
    return val;
  }
}
