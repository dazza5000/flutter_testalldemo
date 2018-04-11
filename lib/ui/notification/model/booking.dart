class Booking {
  int id;
  int doctor;
  String doctorName;
  String image;
  int status;
  String customMesg;
  String time;
  var rawtime;
  var createDate;
  var timeAgo;

  Booking(this.id, this.doctor, this.doctorName, this.image, this.status,
      this.customMesg, this.time, this.rawtime, this.createDate, this.timeAgo);

}