import 'dart:async';
import 'package:lyc_clinic/base/data/message.dart';

abstract class CommentEditRepository{
  Future<Message> updateComment(String accessCode, int doctorId, int reviewId, String mesg);
  Future<Message> updateCommentReply(String accessCode, int doctorId, int reviewId, String mesg,int replyid);
  Future<Message> updateArticleComment(String accessCode,int articleId,int commentId, String mesg);
  Future<Message> updateArticleCommentReply(String accessCode,int articleId,int commentId,int replyid, String mesg);  
}