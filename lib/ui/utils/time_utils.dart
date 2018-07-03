import 'package:intl/intl.dart';

class TimeUtils {
  static String getTime(int seconds) {
    String mSec = "စကၠန္႔";
    String mMin = "မိနစ္";
    String mHour = "နာရီ";
    String mLastAgo = "လြန္ခဲ့ေသာ";

    if (seconds < 60) {
      return "$mLastAgo $seconds $mSec";
    } else {
      int tempMin = seconds ~/ 60;
      int tempHour;
      if (tempMin > 60) {
        tempHour = tempMin ~/ 60;
        print("${tempMin % 60} $tempMin");
        tempMin = (tempMin % 60).toInt();
        if (tempMin > 0) {
          return "$mLastAgo $tempHour $mHour $tempMin $mMin";
        } else {
          return "$mLastAgo $tempHour $mHour";
        }
      } else {
        return "$mLastAgo $tempMin $mMin";
      }
    }
  }

  static String getDate(int t) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(t);
    DateTime d=date.toLocal();
    print('Date Time $d');
    var dateFormat = new DateFormat("MMM dd yyyy' 'hh:mm:ss a");
    return dateFormat.format(d);
  }

  static String getMonthNameYear(DateTime d){
    String dateFormat=new DateFormat.yMMMM().format(d);
    return dateFormat;
  }

  static String getMonthDayYear(DateTime d){
    String dateFormat=new DateFormat.yMMMd().format(d);
    return dateFormat;
  }

  static String getYearMonthDay(DateTime d){
    var dateFormat=DateFormat("yyyy-MM-dd");
    return dateFormat.format(d);
  }
  static String getTimeZone() {
    return null;
  }

  static String getDateWithoutHours(int t) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(t);
    print('Date Time Zone${date.timeZoneName}');
    var dateFormat = DateFormat("MMM dd yyyy");
    return dateFormat.format(date);
  }

  static String getDateWithoutHoursByDate(DateTime date) {
    var dateFormat = DateFormat("MMM dd yyyy");
    //dateFormat.ti.timeZone = TimeZone.getDefault()
    return dateFormat.format(date);
  }


}
