import 'package:lyc_clinic/ui/home/data/booking.dart';
import 'package:lyc_clinic/base/data/pagination.dart';

abstract class UserBookingContract{
  void onLoadError();
  void showAllBookingList(  List<Booking> b );
  void showConfirmedBookingList(  List<Booking> b );
  void showRequestedBookingList(  List<Booking> b );
  void showUnavailableBookingList(  List<Booking> b );
  void showCompleteBookingList(  List<Booking> b );
  void showCancelledBookingList(  List<Booking> b );
  void showMoreBookingList(  List<Booking> b );
  void pagination(  Pagination p );
  void showBookingList(  List<Booking> b,  int status );
  void showNoRecordLayout(  List<Booking> b );
}