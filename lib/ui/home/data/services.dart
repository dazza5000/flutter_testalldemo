class Services {
  int id;
  String name;
  String image;

  Services(this.id, this.name, this.image);

  Services.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        image = map['image'];
}