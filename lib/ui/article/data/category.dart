class Category{
  int id;
  String name;
  bool isSelected=false;

  Category(this.id, this.name, this.isSelected);

  Category.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        isSelected = false;
}