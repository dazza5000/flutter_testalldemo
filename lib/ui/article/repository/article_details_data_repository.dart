import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/article/repository/article_details_repository.dart';
import 'package:lyc_clinic/ui/article/data/article_details.dart';
import 'package:lyc_clinic/ui/comment/data/comment.dart';

class ArticleDetailsDataRepository implements ArticleDetailsRepository{
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";
  JsonDecoder _decoder = new JsonDecoder();
  @override
  Future<ArticleDetails> getArticleDetail(String accessCode, int articleId) async{
    http.Response response=await http.get(URL+accessCode+'/article/'+articleId.toString());
    final jsonBody=response.body;
    final statusCode=response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final responseBody=_decoder.convert(jsonBody);
    var articleDetails=new ArticleDetails.fromJson(responseBody);
    return articleDetails;
  }

  @override
  Future<Comment> getComments(String accessCode, int articleId, int perPage) async{
    http.Response response=await http.get(URL+accessCode+'/article/'+articleId.toString()+'/comment');
    final jsonBody=response.body;
    final statusCode=response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final responseBody=_decoder.convert(jsonBody);
    print('comment Response$responseBody');
    var comment=new Comment.fromJson(responseBody);
    return comment;
  }

  @override
  void setShareClick(String accessCode, int articleid) async{
    http.Response response=await http.post(URL+accessCode+'/article'+articleid.toString()+'/share');
    final responseBody=response.body;
    final statusCode=response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || response == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return ;
    }
    print('Response Share$responseBody');

  }

  @override
  void deleteArticleComment(String accessCode, int articleId, int commentId) {
    
  }

  @override
  void setFavorite(String accessCode, int articleId) async{
    http.Response response=await http.post(URL+accessCode+'/article'+articleId.toString()+'/favorite');
    final responseBody=response.body;
    final statusCode=response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || response == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return ;
    }
    print('Response Favourite$responseBody');

  }

  @override
  void saveArticle(String accessCode, int articleId) async{
    http.Response response=await http.post(URL+accessCode+'/article'+articleId.toString()+'/save');
    final responseBody=response.body;
    final statusCode=response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || response == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return ;
    }
    print('Response Save Article$responseBody');
  }
}