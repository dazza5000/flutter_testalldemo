import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/home/data/user_saved.dart';
import 'package:lyc_clinic/ui/home/data/save.dart';
import 'package:lyc_clinic/ui/home/data/saved_article.dart';
import 'package:lyc_clinic/ui/home/data/saved_doctor.dart';
import 'package:lyc_clinic/base/data/pagination.dart';
import 'package:lyc_clinic/ui/doctors/data/doctor.dart';
import 'package:lyc_clinic/ui/doctors/data/schedule.dart';
import 'package:lyc_clinic/ui/article/data/article.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_buttons.dart';
import 'package:lyc_clinic/ui/article/widget/create_article_items.dart';
import 'package:lyc_clinic/ui/doctors/widget/create_doctor_item.dart';
import 'package:lyc_clinic/ui/home/widget/create_article_buttons.dart';

class UserSavedListPage extends StatefulWidget {
  @override
  UserSavedListPageState createState() {
    return new UserSavedListPageState();
  }
}

class UserSavedListPageState extends State<UserSavedListPage> {
  UserSaved userSaved = new UserSaved(new Pagination(1, 17, 1, 1),
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
                    true,
                    false)
            )
        ),

        new Save(
          new SavedArticle(
              true,
              true,
              true,
              new Article(
                4,
                "ကိုယ္၀န္တားေဆး အသံုုးျပဳျခင္းမွ ရရွိလာႏုိင္မည့္အက်ိဳးေက်းဇူးမ်ား",
                1,
                "http://linyaungchi.com/storage/images/article/2018/01/jan25-sample-testing-article-20180320055407.jpg",
                "null",
                "ကိုယ္၀န္တားေဆး ေန ့စဥ္ေသာက္ျခင္းျဖင့္ သားဆက္ျခားေပးႏုိင္သည့္ရလဒ္တစ္ခုသာရွိသည္ဟု ထင္မွတ္ထား ပါက သင့္ယူဆခ်က္ကို ထပ္မံျဖည့္စြက္ေပးပါရေစ။ ကိုယ္၀န္တားေဆးသည္ ကိုယ္၀န္တားျခင္းအျပင္&nbsp; အျခား ေသာ အက်ိဳးေက်းဇူးမ်ားလည္း ထပ္မံေပးစြမ္းႏုိင္ေၾကာင္း သုေတသနစစ္တမ္းမ်ားမွ ေဖာ္ျပထားပါတယ္။ (၁) တားေဆးကဒ္တစ္ကဒ္တြင္ ေဟာ္မုန္းပါေသာ ေဆးလံုး ၂၁လံုး သံုးပတ္စာ ပါ၀င္ျပီး က်န္ေသာတစ္ပတ္စာ ၇လံုး မွာ ေဟာ္မုန္း မပါေသာ ေဆးလံုးမ်ား သာျဖစ္ပါတယ္။ ထို ့အတြက္ ကိုယ္၀န္တားေဆး ေသာက္ေန တဲ့ အမ်ိဳးသမီးမ်ားမွာ မိမိတို ့ရာသီဓမၼတာ စက္၀န္းကို အခ်ိန္မွန္မွန္လည္ေစႏုိင္မွာ ျဖစ္သလို&nbsp; ရာသီေသြးဆင္းမည့္အခ်ိန္ကိုလည္း ၾကိဳတင္ျပီး သိရွိေစႏုိင္မွာပါ။ . . (၂) ရာသီေသြးဆင္းျခင္းဟာ ေဟာ္မုန္းမ်ားအေျပာင္းအလဲျဖစ္ျခင္းေၾကာင့္ ျဖစ္ေပၚရျခင္းျဖစ္သည့္အတြက္ အေရးၾကီးသည့္ေန ့ရက္မ်ား&nbsp; (ဥပမာ စာေမးပြဲရက္ႏွင့္တိုက္ဆိုင္ေနျခင္း) မ်ားတြင္ ေဟာ္မုန္းမပါသည့္ ေဆးလံုးမ်ား အား မေသာက္ျခင္းျဖင့္ ရာသီေသြးဆင္းမည့္ေန ့ကို အေရြ ့အေျပာင္းျပဳလုပ္လို ့ရပါတယ္။&nbsp; . . (၃) မိ်ဳးဆက္ပြားႏုိင္သည့္အရြယ္အမ်ိဳးသမီး ၁၀% ခန္ ့ဟာ Menorrhagia&nbsp; လို ့ေဆးပညာအရေခၚေ၀ၚတဲ့ ရာသီေသြးအမ်ားၾကီးဆင္းတဲ့အေျခအေနကို&nbsp; ၾကံဳေတြ ့ေနရပါတယ္။ ေသြးဆင္းမ်ားသည့္အတြက္ အခ်ိန္ကာလ ၾကာလာသည့္အခါ ေသြးအားနည္းေရာဂါျဖစ္လာပါတယ္။ ကိုယ္၀န္တားေဆးေသာက္ျခင္းဟာ သားအိမ္နံရံ ကို ပါးေစျခင္းျဖင့္ ရာသီေသြးဆင္းသည့္ပမာဏကို ေလ်ာ့နည္းေပးေစႏုိင္တာပါ။ . .&nbsp; (၄) ဒါ့အျပင္ ရာသီေသြးဆင္းခ်ိန္နဲ ့ကိုက္ျပီးျဖစ္ပြားတတ္တဲ့&nbsp;Migraine ေခါင္းတစ္ျခမ္းကိုက္ေရာဂါကိုလည္း သက္သာေစပါတယ္။&nbsp; အိီစတုုိဂ်င္ ေဟာ္မုန္းဓာတ္ ေသြးထဲတြင္ေလ်ာ့နည္းသြားျခင္းႏွင့္သက္ဆိုင္ေနတဲ့ Migraine ေရာဂါကို ေဟာ္မုန္းအေျပာင္းအလဲျဖစ္ပြားမွဳအား ေလ်ာ့နည္းေစေအာင္ျပဳလုပ္ေပးျခင္းျဖင့္ သက္သာေအာင္ အကူအညီေပးႏုိင္ပါတယ္။&nbsp; . . (၅) သဘာ၀တ၇ားမ်ားအရ အမ်ိဳးသမီးမ်ားဧ။္ ေဟာ္မုန္းမ်ားထုတ္လုပ္ရာတြင္&nbsp; မေဟာ္မုန္းအျပင္ က်ား ေဟာ္မုန္း မ်ား လည္းထုတ္လုပ္ရပါတယ္။အခ်ိဳ ့အမ်ိဳးသမီးေတြမွာ က်ားေဟာ္မုန္းမ်ားပံုမွန္ထက္ပိုျပီး ထုတ္လုပ္ တဲ့ အတြက္အေရျပားေပၚတြင္ အဆီအထြက္မ်ားျခင္း ၊ အဆီဂလင္းမ်ား ထြက္ေပါက္ပိတ္ကာ ၀က္ျခံမ်ားထြက္ျခင္း ၊ ကိုယ္ခႏၶာဆံေမြးထူျခင္းတို ့ျဖစ္တတ္ပါတယ္။&nbsp; ကိုယ္၀န္တားေဆးေသာက္ျခင္းျဖင့္ ျပင္ပမွ ေဟာ္မုန္း ဓာတ္မ်ားရရွိ ေနျခင္းေၾကာင့္ ကိုယ္ခႏၶာမွ ေဟာ္မုန္းမ်ားထုတ္လုပ္ျခင္းေလ်ာ့နည္းေစသျဖင့္ ၀က္ျခံထြက္ျခင္း၊ ကိုယ္ခႏၶာဆံေမြးထူျခင္းတို ့ကိုလည္း သက္သာေစမွာျဖစ္ပါတယ္။&nbsp; . . (၆) ဒါ့အျပင္ အျခားေသာ အမ်ိဳးသမီးေရာဂါတစ္မ်ိဳးျဖစ္တဲ့ Endometriosis ဆိုတဲ့ေရာဂါကိုလည္း သက္ သာဖို ့အတြက္လည္း ကိုယ္၀န္တားေဆးကို အသံုးျပဳႏုိင္ပါေသးတယ္လို ့ဆိုပါတယ္။ Endometriosis က ပံုမွန္ သားအိမ္အတြင္း နံရံမွာရွိတဲ့ တစ္ရွဴးေလးေတြဟာ အျခားေသာေနရာေတြမွာ ေရာက္ရွိေနတဲ့ ေရာဂါ တစ္ မ်ိဳးျဖစ္ပါတယ္။ေဒါက္တာေအာင္ေဇာ္လင္း&nbsp; M.B.,B.S (YGN)",
                2,
                3,
                "ကုိယ္၀န္ေဆာင္မိခင္မ်ား သိေကာင္းစရာ",
                true,
                2,
                2,
                true,
                "https://linyaungchi.com/health-education/4",
              )
          ),
          null,
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
                    true,
                    false)
            )
        ),
      ]);


  Widget _buildUserSavedItem(BuildContext context, int index) {
    if (userSaved.data[index].doctor != null) {
      return new Container(
          child: new Stack(
            children: <Widget>[
              //Doctor Item Card
              new CreateDoctorItem(userSaved.data[index].doctor.data),
              //Floating Action Button
              new Positioned(
                child: new CreateDoctorButton(userSaved.data[index].doctor.data),)

            ],
          )
      );
    }
    else if (userSaved.data[index].article != null) {
      return Container(
        child: new Stack(
          children: <Widget>[
            new CreateArticleItems(userSaved.data[index].article.data),
            new Positioned(
              child: new CreateArticleButton(userSaved.data[index].article.data),
              bottom: 20.0,
              right: 10.0,
              top: 0.0,
              left: 20.0,
            ),

          ],
        ),
      );
    }
    else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      controller: new ScrollController(),
      scrollDirection: Axis.vertical,
      child: new Container(
          color: MyStyle.layoutBackground,
          child: new ListView.builder(
              itemBuilder: _buildUserSavedItem,
              itemCount: userSaved.data.length,
              shrinkWrap: true,
              reverse: true,
              controller: new ScrollController(),
              scrollDirection: Axis.vertical
          )
      ),
    );
  }
}