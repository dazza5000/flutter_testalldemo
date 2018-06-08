class DoctorRole {
  int id;
  String name;
  bool isSelected=false;

  DoctorRole(this.id, this.name, this.isSelected);

  DoctorRole.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        isSelected = false;
}
