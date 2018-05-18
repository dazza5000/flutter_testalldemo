import 'package:lyc_clinic/ui/home/model/user_saved.dart';
import 'package:lyc_clinic/ui/home/model/save.dart';
import 'package:lyc_clinic/ui/home/model/saved_article.dart';
import 'package:lyc_clinic/ui/home/model/saved_doctor.dart';
import 'package:lyc_clinic/base/model/pagination.dart';
import 'package:lyc_clinic/ui/doctors/model/doctor.dart';
import 'package:lyc_clinic/ui/doctors/model/schedule.dart';
import 'package:flutter/material.dart';

class SaveDataServices {

  static UserSaved _getSavedData() {
    return new UserSaved(new Pagination(1, 17, 1, 1),
        [
          new Save(
              null,
              new SavedDoctor(true,
                  false,
                  false,
                  new Doctor(
                      65,
                      "ေဒါက္တာယမင္းရူပါထြန္း",
                      "",
                      "ဗဟိုအမ်ိဳးသမီးေဆးရံုၾကီး",
                      false,
                      "Radiologists (ဓါတ္ေရာင္ျခည္ဆုုိင္ရာ အထူးကုုဆရာ၀န္)",
                      "M.B.,B.S,M.Med.Sc(Radiology)",
                      [
                        new Schedule(
                            210,
                            "06:30 pm",
                            1526495400,
                            7,
                            "Sat"
                        )
                      ],
                      true,
                      1,
                      0,
                      "http://linyaungchi.com",
                      false,
                      false)
              )
          ),
          new Save(
              null,
              new SavedDoctor(true,
                  false,
                  false,
                  new Doctor(
                      65,
                      "ေဒါက္တာယမင္းရူပါထြန္း",
                      "",
                      "ဗဟိုအမ်ိဳးသမီးေဆးရံုၾကီး",
                      false,
                      "Radiologists (ဓါတ္ေရာင္ျခည္ဆုုိင္ရာ အထူးကုုဆရာ၀န္)",
                      "M.B.,B.S,M.Med.Sc(Radiology)",
                      [
                        new Schedule(
                            210,
                            "06:30 pm",
                            1526495400,
                            7,
                            "Sat"
                        )
                      ],
                      true,
                      1,
                      0,
                      "http://linyaungchi.com",
                      false,
                      false)
              )
          )
        ]);
  }

  static TextStyle appbarTitleStyle() {
    return new TextStyle(color: Colors.black, fontSize: 14.0);
  }
}