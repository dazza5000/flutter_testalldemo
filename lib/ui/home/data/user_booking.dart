import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/home/data/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_booking.g.dart';

@JsonSerializable()
class UserBooking extends Object with _$UserBookingSerializerMixin{
  Pagination pagination;
   List<Booking> data ;

  UserBooking(this.pagination, this.data);

  factory UserBooking.fromJson(Map<String, dynamic> json) => _$UserBookingFromJson(json);

  @override
  String toString() {
    return 'UserBooking is{pagination: $pagination, data: $data}';
  }


}