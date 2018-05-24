class Article {
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

  Article(this.id, this.title, this.type, this.image, this.video, this.content,
      this.category, this.commentCount, this.categoryName, this.fav,
      this.favCount, this.share, this.save, this.shareUrl);
}