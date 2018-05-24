class BannerData {
  int id;
  String img;
  String link;

  BannerData(this.id, this.img, this.link);

  BannerData.fromMap(Map<String, dynamic> map)
      :id=map['id'],
        img=map['img'],
        link =map['link'];

}