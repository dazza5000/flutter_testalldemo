class Account{
  String accessCode;
  String name;
  String image;

  Account(this.accessCode, this.name, this.image);

  Account.fromMap(Map<String, dynamic> map)
      : accessCode = map['accessCode'],
        name=map['name'],
        image=map['image'];

  @override
  String toString() {
    return 'Account{accessCode: $accessCode, name: $name, image: $image}';
  }


}