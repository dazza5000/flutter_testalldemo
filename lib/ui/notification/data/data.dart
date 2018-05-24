import 'package:lyc_clinic/ui/notification/data/comment.dart';
import 'package:lyc_clinic/ui/notification/data/review.dart';
import 'package:lyc_clinic/ui/notification/data/booking.dart';

class Data {
  int id;
  Comment commentreply;
  Review reviewreply;
  Booking booking;
  String type;

  Data(this.id, this.commentreply, this.reviewreply, this.booking, this.type);

}