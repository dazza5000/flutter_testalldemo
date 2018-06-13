import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_buttons.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_item.dart';

class DoctorLists extends StatelessWidget{

  final List<Doctor> doctors;
  DoctorClickListener listener;

  DoctorLists(this.doctors,[this.listener]);

  List<String> scheduleArr = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Widget> widgets;


  Widget _buildDoctorLists(BuildContext context, int index) {
    var doctor = doctors[index];
    return new Stack(
      children: <Widget>[
        //Doctor Item Card
        new CreateDoctorItem(doctor),
        //Floating Action Button
        new Positioned(
          child: new CreateDoctorButton(doctor,listener),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Doctor List ${doctors.length}');
    return new Container(
      child: new Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: new ListView.builder(
            shrinkWrap: true,
            controller: new ScrollController(),
            itemBuilder: _buildDoctorLists,
            itemCount: doctors.length,
            scrollDirection: Axis.vertical,)
      ),
    );
  }

}

