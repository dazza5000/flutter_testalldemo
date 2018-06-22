class BookingRequest {
  int user;
  String schedule;
  String date;
  int status;
  String updated_at;
  String created_at;
  int id;

  BookingRequest(this.user, this.schedule, this.date, this.status,
      this.updated_at, this.created_at, this.id);

  BookingRequest.fromMap(Map<String, dynamic> map)
      : user = map['user'],
        schedule = map['schedule'],
        date = map['date'],
        status = map['status'],
        updated_at = map['updated_at'],
        created_at = map['created_at'],
        id = map['id'];
  
}