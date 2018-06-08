class Message{
  String mesg;
  bool status;

  Message(this.mesg, this.status);

  @override
  String toString() {
    return 'Message{mesg: $mesg, status: $status}';
  }


  Message.fromMap(Map<String, dynamic> map)
      : mesg = map['mesg'],
  status = map['status'];

  /*factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);*/
}