import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable()
class Article extends Object with _$ArticleSerializerMixin{
  int id;
  String title;
  int type;
  String image;
  String video;
  String content;
  int category;
  int commentCount;
  String categoryName;
  bool fav;
  int favCount;
  int share;
  bool save;
  String shareUrl;

  Article(
      [this.id,
      this.title,
      this.type,
      this.image,
      this.video,
      this.content,
      this.category,
      this.commentCount,
      this.categoryName,
      this.fav,
      this.favCount,
      this.share,
      this.save,
      this.shareUrl]);

  Article.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        type=map['type'],
        image = map['image'],
        video = map['video'],
        content = map['content'],
        category = map['category'],
        commentCount = map['commentCount'],
        categoryName = map['categoryName'],
        fav = map['fav'],
        favCount = map['favCount'],
        share = map['share'],
        save = map['save'],
        shareUrl = map['shareUrl'];

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  @override
  String toString() {
    return '{id: $id, title: $title, type: $type, image: $image, video: $video, content: $content, category: $category, commentCount: $commentCount, categoryName: $categoryName, fav: $fav, favCount: $favCount, share: $share, save: $save, shareUrl: $shareUrl}';
  }


}
