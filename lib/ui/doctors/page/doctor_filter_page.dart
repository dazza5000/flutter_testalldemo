import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor_role.dart';

class DoctorFilterPage extends StatefulWidget {
  List<DoctorRole> doctorRoles = [
    new DoctorRole(3, "General Physician (အေထြေထြေရာဂါအထူးကုုသမားေတာ္)", false),
    new DoctorRole(2, "Dermatologist (အေရျပားေရာဂါ အထူးကုုဆရာ၀", false),
    new DoctorRole(1, "Surgeons (ခဲြစိတ္ေရာဂါ အထူးကုုဆ", false),
    new DoctorRole(4, "Paediatrician (ကေလး အထူးကုုဆရာ၀န္", false),
    new DoctorRole(5, "Cardiologist (ႏွလုုံးေရာဂါ အထူးကုု", false),
    new DoctorRole(6, "OG (သားဖြားႏွင့္မီးယပ္ ေရာဂါ အထူးက", false),
    new DoctorRole(
        7, "Orthopaedic Surgeons (အရုုိးအေၾကာ ခဲြစိတ္ အထူးကုု", false),
    new DoctorRole(
        13, "ENT Surgeon (နား၊ႏွာေခါင္း၊လည္ေခ်ာင္း ေရာဂါ အထူး", false),
    new DoctorRole(14, "Chest Physician (အဆုုတ္ေရာဂါ အထူးကုုဆရာ၀", false),
    new DoctorRole(15, "Psychiatrist (စိတ္က်န္းမာေရး အထူးကုုဆရ", false),
    new DoctorRole(16, "UroPhysician (ဆီးႏွင့္ေက်ာက္ကပ္ေရာဂါ အထူးကုု", false),
    new DoctorRole(17, "Chest Physician (အဆုုတ္ေရာဂါ အထူးကုုဆရာ၀", false),
    new DoctorRole(18, "UroSurgeon (ဆီးႏွင့္ေက်ာက္ကပ္ ခဲြစိတ္ အထူး", false),
    new DoctorRole(
        19, "GI Physician (အစာအိမ္၊အူလမး္ေၾကာင္းေရာဂါ အထူးကုု", false),
    new DoctorRole(20, "Neurologist (ဦးေႏွာက္ႏွင့္အာရုုံေၾကာေရာဂါ အထူ", false),
    new DoctorRole(
        21, "Paediatric Neurologist (ကေလးဦးေႏွာက္ႏွင့္အာရုုံေၾကာ အထူးက",
        false),
    new DoctorRole(22, "Hepatologist (အသည္းေရာဂါ အထူးကုုဆရာ၀", false),
    new DoctorRole(23, "Radiologists (ဓါတ္ေရာင္ျခည္ဆုုိင္ရာ အထူးကု", false),
    new DoctorRole(24,
        "Paediatric Neurologist (General Practitioner (အေထြေထြေရာဂါကု ဆရာ၀န္",
        false),
  ];

  @override
  DoctorFilterPageState createState() {
    return new DoctorFilterPageState();
  }
}

class DoctorFilterPageState extends State<DoctorFilterPage> {
  int goupValue;

  _clickRadio(int i) {
    setState(() {
      goupValue = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: MyStyle.colorWhite,
        title: new Text('Filters', style: MyStyle.appbarTitleStyle()),
        leading: new IconButton(
            icon: new Icon(Icons.clear, color: MyStyle.colorBlack),
            onPressed: () => Navigator.pop(context)),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text('Speciality',
              style: new TextStyle(fontSize: MyStyle.xlarge_fontSize),),
            new Flexible(
                child: new ListView.builder(
                  padding: const EdgeInsets.only(top: 10.0),
                  controller: new ScrollController(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: _buildSpecialityList,
                  itemCount: widget.doctorRoles.length,
                )
            ),
            /*new Expanded(
                child: new Column(children: <Widget>[],)),
            new Row(
                children: <Widget>[
                  new Expanded(
                      child: new MaterialButton(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15.0),
                        child: new Text('Continue',
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: MyStyle.medium_fontSize),),
                        onPressed: null,
                        color: MyStyle.colorGreen,)),
                ]
            )*/

          ],
        ),
      ),
    );
  }

  Widget _buildSpecialityList(BuildContext context, int index) {
    var doctorRole = widget.doctorRoles[index];
    bool isSelected = doctorRole.isSelected;
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new ListTile(
          title: new Text(doctorRole.name),
          trailing: new Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? MyStyle.colorGreen : MyStyle
                  .colorGrey),
          onTap: () {
            setState(() {
              widget.doctorRoles[index].isSelected = !isSelected;
            });
          },
        ),
        new Divider(color: MyStyle.defaultGrey, height: 2.0,),
      ],
    );
  }
}