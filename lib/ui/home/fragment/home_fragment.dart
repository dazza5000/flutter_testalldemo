import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/home/model/services.dart';
import 'package:lyc_clinic/ui/home/widget/services_scroller.dart';
import 'package:lyc_clinic/ui/home/widget/image_banner.dart';
import 'package:lyc_clinic/ui/doctors/widget/doctor_lists.dart';
import 'package:lyc_clinic/ui/doctors/model/doctor.dart';


class HomeFragment extends StatelessWidget {

  List<String> images = [
    'images/1.png', 'images/2.png', 'images/3.png', 'images/4.png'];
  List<Services> services = [
    new Services(1, 'အထူးကုုဆရာ၀န္မ်ားႏွင့္ျပသ ေဆြးေႏြ',
        'http://linyaungchi.com/storage/images/service/fHuFoj8XRQIIFRnpvlLK-20180214091648.jpg'),
    new Services(2, 'ပုုံရိပ္ေဖာ္ ေရာဂါ',
        'http://linyaungchi.com/storage/images/service/THQ5UqmFvxFhCBkZWHVm-20180206075851.jpg'),
    new Services(3, 'ႏုိင္ငံတကာအဆင့္မီွ ဓါတ္ခဲြခန္း ျဖင္',
        'http://linyaungchi.com/storage/images/service/X5hpM9Rtn9z7yyintl0e-20180202061940.jpg'),
    new Services(4, 'Medical Checkup (က်န္းမာေရး စစ္ေဆးျ',
        'http://linyaungchi.com/storage/images/service/xDyqu8HrsgwLBh3xDg7G-20180202061903.jpg'),
    new Services(5, 'IUI နည္းပညာျဖင့္ သားသမီးရရိွေအာင္ျပဳ',
        'http://linyaungchi.com/storage/images/service/3qDBUGTaqDF9VQHsBBVO-20180213092304.jpg')
  ];

  List<Doctor> doctors=[new Doctor( 65, "ေဒါက္တာယမင္းရူပါထြန္း","","ဗဟိုအမ်ိဳးသမီးေဆးရံုၾကီး",false,'Radiologists(ဓါတ္ေရာင္ျခည္ဆုုိင္ရာ အထူးကုုဆရာ၀န္)', "M.B.,B.S,M.Med.Sc(Radiology)", null,true, 1, 0,"http://linyaungchi.com", false, true),new Doctor( 65, "ပါေမာကၡေဒါက္တာလွလွ","","ဗဟိုအမ်ိဳးသမီးေဆးရံုၾကီး",false,'Radiologists(ဓါတ္ေရာင္ျခည္ဆုုိင္ရာ အထူးကုုဆရာ၀န္)', "M.B.,B.S,M.Med.Sc(Radiology)", null,true, 1, 0,"http://linyaungchi.com", false, true)];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SingleChildScrollView(
          child: new Center(
              child: new Column(
                children: <Widget>[
                  new ImageBanner(images),
                  new ServicesScroller(services),
                  new DoctorLists(doctors),
                ],
              )
          ),
        )
    );
  }
}