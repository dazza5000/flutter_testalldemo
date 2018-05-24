import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/comment/data/reply.dart';

class CommentReply {
  Pagination pagination;
  List<Reply> data;

  CommentReply(this.pagination, this.data);

}