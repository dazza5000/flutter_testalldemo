class Service {
  int id;
  String name;
  String image;

  Service(this.id, this.name, this.image);

  Service.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'],
        image=map['image'];
}