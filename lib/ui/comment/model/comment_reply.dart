import 'package:lyc_clinic/base/model/pagination.dart';
import 'package:lyc_clinic/ui/comment/model/reply.dart';

class CommentReply {
  Pagination pagination;
  List<Reply> data;

  CommentReply(this.pagination, this.data);

}