import 'package:lyc_clinic/base/model/pagination.dart';
import 'package:lyc_clinic/ui/comment/model/review.dart';
class Comment{
  Pagination pagination;
  List<Review> data;

  Comment(this.pagination, this.data);

}