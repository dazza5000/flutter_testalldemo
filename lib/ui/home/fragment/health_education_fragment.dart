import 'package:flutter/material.dart';
import 'package:lyc_clinic/ui/home/fragment/health_education_fragment.dart';
import 'package:lyc_clinic/ui/article/widget/create_feature_article_items.dart';
import 'package:lyc_clinic/ui/home/widget/article_lists.dart';
import 'package:lyc_clinic/ui/article/model/article.dart';
import 'package:lyc_clinic/ui/home/fragment/filter_health_education_dialog_fragment.dart';
import 'package:lyc_clinic/test/test_page.dart';

class HealthEducationFragment extends StatelessWidget {
  List<Article> articles = [
    new Article(
      10,
      "လူငယ္ႏွင့္၀က္ျခံ",
      1,
      "http://linyaungchi.com/storage/images/article/2018/02/skincare-best-products-20180215073828.jpg",
      "",
      "Acne ဆိုတဲ့၀က္ျခံအေၾကာင္း အပိုင္း (၁) ၀က္ျခံဘယ္လိုေပ်ာက္ေအာင္ကုရမလဲဆိုတဲ့ ေမးခြန္းက လူအမ်ားစု&nbsp; ေမးဖူးတဲ့ေမးခြန္းေလးတစ္ခုပါ။ ၀က္ျခံ န႕ဲ ကင္းလြတ္တဲ့သူဆိုတာ မရွိသေလာက္ေတာ့ရွားမွာပဲ ဒါေပမယ့္&nbsp; တခ်ိဳ ့ေတြမွာေတာ့ အျခားသူေတြထက္ ၀က္ျခံထြက္တာနည္းတာေတာ့အမွန္ပဲ။၀က္ျခံထြက္ေတာ့မွ ဘယ္လိုေပ်ာက္ေအာင္ကုမလဲဆိုတာထက္ ၀က္ျခံ မထြက္ ခင္ကတည္းက ၀က္ျခံထြက္ နည္း ေအာင္ ဘယ္လိုမ်ိဳး ျပဳမူေနထိုင္မလဲဆိုတာကို ပိုျပီးဦးစား ေပးသင့္ ပါတယ္၊၊ ၀က္ျခံထြက္ ရတဲ့ အ ေၾကာင္းရင္းခံေလးကိုေတာ့ေသေသခ်ာခ်ာ သိ ေစခ်င္ပါတယ္။ ဘာေၾကာင့္၀က္ျခံထြက္ရလဲ……။ မ်က္ႏွာအေရျပားေပၚမွာ ဆဲလ္အေသေတြ ၊ အဆီ (sebum) ေတြကေန&nbsp; တစ္ဆင့္ ေခြ်းေပါက္၊အဆီေပါက္ေတြကို ပိတ္ဆို ့ေနရာကေန&nbsp; ဘက္တီးရီးယားေတြေပါက္ဖြားရာကေန တစ္ဆင့္ Acne Vulgaris ဆို တဲ့&nbsp; ၀က္ျခံကေလးေတြ ေပၚလာတာျခင္းျဖစ္တယ္။&nbsp; အပ်ိဳ လူပ်ိဳေဖာ္၀င္ခ်ိန္ကစျပီး က်ားေဟာ္မုန္းေတြ လွံဳေဆာ္မွဳနဲ ့ ဘယ္သူမွာမဆို အဆီဂလင္းေတြ အဆီထုတ္လုပ္ရာကေန မ်က္နွာျပင္ေပၚပြင့္တဲ့ျပြန္ေခ်ာင္းေလးေတြကို ပိတ္ဆို ့ေစျခင္းျဖစ္ပါတယ္။ အဓိကျဖစ္ရတဲ့အေၾကာင္းရင္းက&nbsp; တိတိက်က်ရယ္လို ့ သတ္သတ္မတ္မတ္မရွိေသးေပမယ့္ Androgen ဆိုတဲ့ က်ားေဟာ္မုန္းပမာဏ ျမင့္တက္ လာျခင္း ေၾကာင့္ျဖစ္တယ္လို ့ကြ်မ္းက်င္သူူေတြကလက္ခံယူဆထားၾကတာပါ။&nbsp; မ်ိဳးရိုးဗီဇေၾကာင့္လည္း ျဖစ္တတ္တယ္ဆိုတဲ့ သုေတသနအခ်ိဳ့လည္းရွိတယ္။&nbsp; ေသခ်ာတာကေတာ့ ေဟာ္မုန္းအေျပာင္းအလဲျဖစ္တဲ့အခ်ိန္ ဥပမာ အပ်ိဳအရြယ္လူပ်ိဳအရြယ္ေရာက္လာတဲ့အခ်ိန္ ၊ အမ်ိဳးသမီးေတြဆို ကိုယ္၀န္ေဆာင္ခ်ိန္ ေနာက္ျပီး ပတ္၀န္းက်င္ ရာသီဥတု သဟဇာတ ျဖစ္ေအာင္ မ ေနတဲ့အခါေတြ ဥပမာ အဆီဓာတ္မ်ားတဲ့ မိတ္ကပ္ေတြလိမ္းတာ၊ ေခြ်းအရမ္းထြက္တာကို ဂရုမစိုက္တဲ့အခါ ၊ ပူအိုက္စြတ္စုိတဲ့ရာသီ နဲ ့ မ်က္နွာျပင္ကို သန့္ရွင္းေရးလုပ္ေဆာင္တာ အားနညး္တဲ့သူေတြမွာျဖစ္တာမ်ားတယ္။ လူငယ္ေတြမွာပဲျဖစ္တတ္တဲ့၀က္ျခံလား။&nbsp; &nbsp;ဘယ္အသက္အရြယ္မွာမဆို က်ား၊မ မေရြးျဖစ္တတ္ပါတယ္။ ကိုယ္၀န္ေဆာင္လည္းျဖစ္ပါတယ္။ ေယာက်ာၤးေလးေတြက မိန္းကေလးေတြထက္&nbsp; ပိုျပီးၾကာၾကာျဖစ္ေလ့ရွိတတ္တယ္။ လူငယ္အရြယ္မွာပဲ ေတြ ့ရမ်ားဆံုးျဖစ္ေပမယ့္ အသက္အရြယ္မေရြးလည္းျဖစ္တတ္ပါတယ္။ ၀က္ျခံထြက္တဲ့အေၾကာင္းအရင္းေတြကိုသိရွိမွ ကာကြယ္မွႈဘယ္လိုလုပ္ေဆာင္သင့္သလဲဆုိတာ ပိုမိုသိရွိႏုိင္မွာျဖစ္တဲ့အတြက္ အပိုင္း(၂) မွာ ၀က္ျခံဘယ္လိုကာကြယ္သင့္သလဲဆိုတာကို ေျပာျပေပးသြားမွာပါ။ ကံေကာင္းျပီး ၀က္ျခံလံုး၀အထြြက္နည္းတဲ့သူေတြထဲမွာမပါရင္ေတာ့ မိမိတုိ့အေနနဲ ့ ၀က္ျခံထြက္လာတဲ့အခါ ျမန္ျမန္ဆန္ဆန္သက္သာသြားေအာင္ ၊ ရွိျပီးသားလည္းပိုျပီးမဆိုးေအာင္လုပ္ရမယ့္ နည္းလမ္းေလး ေတြေျပာ ျပ ပါမယ္။ (၁) လက္ေဆးပါ။ လက္ဆိုတဲ့ ကိုယ္အဂၤါအစိတ္္အပိုင္းဟာ ေရာဂါပိုးေပါင္းမ်ားစြာတို ့ကို အဓိကသယ္ယူပို ့ေဆာင္ေပးေနတာပဲ။ မ်က္ႏွာကို သိစိတ္နဲ ့ပဲျဖစ္ေစ အမႈမဲ့အမွတ္မဲ့ျဖစ္ေစလက္နဲ ့ ပြတ္မိ ၊ ထိမိ ၊ ကုတ္မိတဲ့ အၾကိမ္တိုင္းမွာ လက္မေဆးထားဘူးဆို ေရာဂါပိုးေပါင္းမ်ားစြာ ကူးစက္ေစႏုိင္ျပီး ၀က္ျခံကို ပိုျပီးဆိုးရြားေစပါတယ္။ (၂) ေရမ်ားမ်ားေသာက္ပါ။ ေရေသာက္ျခင္းက ကိုယ္ခႏြာရဲ ့အဆိပ္အေတာက္မ်ားကို ရွင္းလင္းေပးတဲ့အျပင္ က်န္းမာတဲ့အသား အေရအတြက္ လည္း ေရဓာတ္က မရွိမျဖစ္လိုအပ္တဲ့အရာလည္းျဖစ္ပါတယ္။ (၃) အိပ္ေရး၀ေအာင္အိပ္ပါ။&nbsp; အိပ္ေရးမ၀ဘူးဆိုတဲ့လူတစ္္ေယာက္ရဲ့စိတ္ထဲမွာ အေတြးတစ္ခုခုက ၀င္ေရာက္စိုးမိုးျပီးေနရာယူထားပါျပီ။ သင့္ရဲ ့အိပ္စက္ခ်ိန္ကို ခုိးယူေနတဲ့ စိတ္ဖိစီးမႈေတြက ၀က္ျခံကို ပိုမိုဆိုးရြားေစပါတယ္။ အိပ္ေပ်ာ္တဲ့အခ်ိန္ေနာက္က်တဲ့အခါ ထတဲ့အခ်ိန္ကလည္း ေျပာင္းလဲျပီး ခႏြာကိုယ္ရဲ ့ဇီ၀ နာရီအ ေျပာင္းအလဲ ေတြေၾကာင့္ ၀က္ျခံကို ပိုဆိုးေစႏုိင္ပါတယ္။ (၄) ရာသီဥတုနဲ ့လုိက္ေလ်ာညီေထြေအာင္ေနထုိုင္ပါ။&nbsp; ၀က္ျခံက မ်က္ႏွာျပင္အသားအေရအေပၚမွာပဲထြက္တာမဟုတ္ပါဘူး။ ဦးေရျပားမွာလည္းထြက္တတ္ပါတယ္။ ပူေလာင္တဲ့ရာသီဥတုမွာ ေခြ်း နဲ ့အဆီအထြက္မ်ားေစတဲ့ ဦးထုပ္၊ ေခါင္းအေဆာင္းစတဲ့အရာေတြေၾကာင့္ ပိတ္ေလွာင္ျပီး ဘက္တီးရီးယားေတြေပါက္ဖြားဖို ့အခြင့္အလမ္းပိုမ်ားပါတယ္။ ေနပူထဲလည္း သိပ္မထြက္ပါနဲ ့။ (၅) မ်က္ႏွာျပင္အသားအေရကို ဂရုစိုက္ေပးပါ။ မ်က္ႏွာ ခဏခဏသစ္ျခင္း ၊ ပြတ္တိုက္သစ္ျခင္းတို ့ကို ေရွာင္ၾကဥ္သင့္တယ္။ ေရေႏြးေႏြး ေလး နဲ ့ဆပ္ျပာအေပ်ာ့စားကို အသံုးျပဳျခင္းက အသင့္ေတာ္ဆံုးပါ။ Benzoyl Peroxide ပါတဲ့ လိုရွင္းကို အသံုးျပဳ သင့္ပါတယ္။ ျပီးေတာ့ ၀က္ျခံကို သြားမညစ္ပါနဲ ့။ မိတ္ကပ္ကိုမဖ်က္ပဲနဲ ့ ညအိိပ္လိုက္တာကလည္း မလုပ္သင့္ပါ။ အထက္ပါေရးခဲ့တဲ့နည္းလမ္းေတြနဲ ့ ထိန္းသိမ္းေပမဲ့ ၀က္ျခံပိုထြက္လာရင္ ၊ ပိုဆိုးလာရင္ ၊ မ်က္ႏွာေပၚမွာ အမာရြတ္ေတြ အမဲစက္ေတြ ျဖစ္လာရင္ အေရျပားအထူးကုဆရာ၀န္ေတြနဲ ့ တုိင္ပင္ေဆြးေႏြးျပီး ကုသ သင့္ပါတယ္။ အေရျပားဆရာ၀န္နဲ ့ျပသဖို ့မတြန္ ့ဆုတ္ပါနဲ ့လို ့ေျပာပါရေစ။",
      3,
      3,
      "အေရျပားဆုိင္ရာ က်န္းမာေရး",
      false,
      2,
      1,
      false,
      "https://linyaungchi.com/health-education/10",),
    new Article(
      10,
      "ရင္သားကင္ဆာအေၾကာင္းသိေကာင္းစရ",
      2,
      "http://linyaungchi.com/storage/images/article/2018/01/feature-article-20180320065420.jpg",
      "",
      "Acne ဆိုတဲ့၀က္ျခံအေၾကာင္း အပိုင္း (၁) ၀က္ျခံဘယ္လိုေပ်ာက္ေအာင္ကုရမလဲဆိုတဲ့ ေမးခြန္းက လူအမ်ားစု&nbsp; ေမးဖူးတဲ့ေမးခြန္းေလးတစ္ခုပါ။ ၀က္ျခံ န႕ဲ ကင္းလြတ္တဲ့သူဆိုတာ မရွိသေလာက္ေတာ့ရွားမွာပဲ ဒါေပမယ့္&nbsp; တခ်ိဳ ့ေတြမွာေတာ့ အျခားသူေတြထက္ ၀က္ျခံထြက္တာနည္းတာေတာ့အမွန္ပဲ။၀က္ျခံထြက္ေတာ့မွ ဘယ္လိုေပ်ာက္ေအာင္ကုမလဲဆိုတာထက္ ၀က္ျခံ မထြက္ ခင္ကတည္းက ၀က္ျခံထြက္ နည္း ေအာင္ ဘယ္လိုမ်ိဳး ျပဳမူေနထိုင္မလဲဆိုတာကို ပိုျပီးဦးစား ေပးသင့္ ပါတယ္၊၊ ၀က္ျခံထြက္ ရတဲ့ အ ေၾကာင္းရင္းခံေလးကိုေတာ့ေသေသခ်ာခ်ာ သိ ေစခ်င္ပါတယ္။ ဘာေၾကာင့္၀က္ျခံထြက္ရလဲ……။ မ်က္ႏွာအေရျပားေပၚမွာ ဆဲလ္အေသေတြ ၊ အဆီ (sebum) ေတြကေန&nbsp; တစ္ဆင့္ ေခြ်းေပါက္၊အဆီေပါက္ေတြကို ပိတ္ဆို ့ေနရာကေန&nbsp; ဘက္တီးရီးယားေတြေပါက္ဖြားရာကေန တစ္ဆင့္ Acne Vulgaris ဆို တဲ့&nbsp; ၀က္ျခံကေလးေတြ ေပၚလာတာျခင္းျဖစ္တယ္။&nbsp; အပ်ိဳ လူပ်ိဳေဖာ္၀င္ခ်ိန္ကစျပီး က်ားေဟာ္မုန္းေတြ လွံဳေဆာ္မွဳနဲ ့ ဘယ္သူမွာမဆို အဆီဂလင္းေတြ အဆီထုတ္လုပ္ရာကေန မ်က္နွာျပင္ေပၚပြင့္တဲ့ျပြန္ေခ်ာင္းေလးေတြကို ပိတ္ဆို ့ေစျခင္းျဖစ္ပါတယ္။ အဓိကျဖစ္ရတဲ့အေၾကာင္းရင္းက&nbsp; တိတိက်က်ရယ္လို ့ သတ္သတ္မတ္မတ္မရွိေသးေပမယ့္ Androgen ဆိုတဲ့ က်ားေဟာ္မုန္းပမာဏ ျမင့္တက္ လာျခင္း ေၾကာင့္ျဖစ္တယ္လို ့ကြ်မ္းက်င္သူူေတြကလက္ခံယူဆထားၾကတာပါ။&nbsp; မ်ိဳးရိုးဗီဇေၾကာင့္လည္း ျဖစ္တတ္တယ္ဆိုတဲ့ သုေတသနအခ်ိဳ့လည္းရွိတယ္။&nbsp; ေသခ်ာတာကေတာ့ ေဟာ္မုန္းအေျပာင္းအလဲျဖစ္တဲ့အခ်ိန္ ဥပမာ အပ်ိဳအရြယ္လူပ်ိဳအရြယ္ေရာက္လာတဲ့အခ်ိန္ ၊ အမ်ိဳးသမီးေတြဆို ကိုယ္၀န္ေဆာင္ခ်ိန္ ေနာက္ျပီး ပတ္၀န္းက်င္ ရာသီဥတု သဟဇာတ ျဖစ္ေအာင္ မ ေနတဲ့အခါေတြ ဥပမာ အဆီဓာတ္မ်ားတဲ့ မိတ္ကပ္ေတြလိမ္းတာ၊ ေခြ်းအရမ္းထြက္တာကို ဂရုမစိုက္တဲ့အခါ ၊ ပူအိုက္စြတ္စုိတဲ့ရာသီ နဲ ့ မ်က္နွာျပင္ကို သန့္ရွင္းေရးလုပ္ေဆာင္တာ အားနညး္တဲ့သူေတြမွာျဖစ္တာမ်ားတယ္။ လူငယ္ေတြမွာပဲျဖစ္တတ္တဲ့၀က္ျခံလား။&nbsp; &nbsp;ဘယ္အသက္အရြယ္မွာမဆို က်ား၊မ မေရြးျဖစ္တတ္ပါတယ္။ ကိုယ္၀န္ေဆာင္လည္းျဖစ္ပါတယ္။ ေယာက်ာၤးေလးေတြက မိန္းကေလးေတြထက္&nbsp; ပိုျပီးၾကာၾကာျဖစ္ေလ့ရွိတတ္တယ္။ လူငယ္အရြယ္မွာပဲ ေတြ ့ရမ်ားဆံုးျဖစ္ေပမယ့္ အသက္အရြယ္မေရြးလည္းျဖစ္တတ္ပါတယ္။ ၀က္ျခံထြက္တဲ့အေၾကာင္းအရင္းေတြကိုသိရွိမွ ကာကြယ္မွႈဘယ္လိုလုပ္ေဆာင္သင့္သလဲဆုိတာ ပိုမိုသိရွိႏုိင္မွာျဖစ္တဲ့အတြက္ အပိုင္း(၂) မွာ ၀က္ျခံဘယ္လိုကာကြယ္သင့္သလဲဆိုတာကို ေျပာျပေပးသြားမွာပါ။ ကံေကာင္းျပီး ၀က္ျခံလံုး၀အထြြက္နည္းတဲ့သူေတြထဲမွာမပါရင္ေတာ့ မိမိတုိ့အေနနဲ ့ ၀က္ျခံထြက္လာတဲ့အခါ ျမန္ျမန္ဆန္ဆန္သက္သာသြားေအာင္ ၊ ရွိျပီးသားလည္းပိုျပီးမဆိုးေအာင္လုပ္ရမယ့္ နည္းလမ္းေလး ေတြေျပာ ျပ ပါမယ္။ (၁) လက္ေဆးပါ။ လက္ဆိုတဲ့ ကိုယ္အဂၤါအစိတ္္အပိုင္းဟာ ေရာဂါပိုးေပါင္းမ်ားစြာတို ့ကို အဓိကသယ္ယူပို ့ေဆာင္ေပးေနတာပဲ။ မ်က္ႏွာကို သိစိတ္နဲ ့ပဲျဖစ္ေစ အမႈမဲ့အမွတ္မဲ့ျဖစ္ေစလက္နဲ ့ ပြတ္မိ ၊ ထိမိ ၊ ကုတ္မိတဲ့ အၾကိမ္တိုင္းမွာ လက္မေဆးထားဘူးဆို ေရာဂါပိုးေပါင္းမ်ားစြာ ကူးစက္ေစႏုိင္ျပီး ၀က္ျခံကို ပိုျပီးဆိုးရြားေစပါတယ္။ (၂) ေရမ်ားမ်ားေသာက္ပါ။ ေရေသာက္ျခင္းက ကိုယ္ခႏြာရဲ ့အဆိပ္အေတာက္မ်ားကို ရွင္းလင္းေပးတဲ့အျပင္ က်န္းမာတဲ့အသား အေရအတြက္ လည္း ေရဓာတ္က မရွိမျဖစ္လိုအပ္တဲ့အရာလည္းျဖစ္ပါတယ္။ (၃) အိပ္ေရး၀ေအာင္အိပ္ပါ။&nbsp; အိပ္ေရးမ၀ဘူးဆိုတဲ့လူတစ္္ေယာက္ရဲ့စိတ္ထဲမွာ အေတြးတစ္ခုခုက ၀င္ေရာက္စိုးမိုးျပီးေနရာယူထားပါျပီ။ သင့္ရဲ ့အိပ္စက္ခ်ိန္ကို ခုိးယူေနတဲ့ စိတ္ဖိစီးမႈေတြက ၀က္ျခံကို ပိုမိုဆိုးရြားေစပါတယ္။ အိပ္ေပ်ာ္တဲ့အခ်ိန္ေနာက္က်တဲ့အခါ ထတဲ့အခ်ိန္ကလည္း ေျပာင္းလဲျပီး ခႏြာကိုယ္ရဲ ့ဇီ၀ နာရီအ ေျပာင္းအလဲ ေတြေၾကာင့္ ၀က္ျခံကို ပိုဆိုးေစႏုိင္ပါတယ္။ (၄) ရာသီဥတုနဲ ့လုိက္ေလ်ာညီေထြေအာင္ေနထုိုင္ပါ။&nbsp; ၀က္ျခံက မ်က္ႏွာျပင္အသားအေရအေပၚမွာပဲထြက္တာမဟုတ္ပါဘူး။ ဦးေရျပားမွာလည္းထြက္တတ္ပါတယ္။ ပူေလာင္တဲ့ရာသီဥတုမွာ ေခြ်း နဲ ့အဆီအထြက္မ်ားေစတဲ့ ဦးထုပ္၊ ေခါင္းအေဆာင္းစတဲ့အရာေတြေၾကာင့္ ပိတ္ေလွာင္ျပီး ဘက္တီးရီးယားေတြေပါက္ဖြားဖို ့အခြင့္အလမ္းပိုမ်ားပါတယ္။ ေနပူထဲလည္း သိပ္မထြက္ပါနဲ ့။ (၅) မ်က္ႏွာျပင္အသားအေရကို ဂရုစိုက္ေပးပါ။ မ်က္ႏွာ ခဏခဏသစ္ျခင္း ၊ ပြတ္တိုက္သစ္ျခင္းတို ့ကို ေရွာင္ၾကဥ္သင့္တယ္။ ေရေႏြးေႏြး ေလး နဲ ့ဆပ္ျပာအေပ်ာ့စားကို အသံုးျပဳျခင္းက အသင့္ေတာ္ဆံုးပါ။ Benzoyl Peroxide ပါတဲ့ လိုရွင္းကို အသံုးျပဳ သင့္ပါတယ္။ ျပီးေတာ့ ၀က္ျခံကို သြားမညစ္ပါနဲ ့။ မိတ္ကပ္ကိုမဖ်က္ပဲနဲ ့ ညအိိပ္လိုက္တာကလည္း မလုပ္သင့္ပါ။ အထက္ပါေရးခဲ့တဲ့နည္းလမ္းေတြနဲ ့ ထိန္းသိမ္းေပမဲ့ ၀က္ျခံပိုထြက္လာရင္ ၊ ပိုဆိုးလာရင္ ၊ မ်က္ႏွာေပၚမွာ အမာရြတ္ေတြ အမဲစက္ေတြ ျဖစ္လာရင္ အေရျပားအထူးကုဆရာ၀န္ေတြနဲ ့ တုိင္ပင္ေဆြးေႏြးျပီး ကုသ သင့္ပါတယ္။ အေရျပားဆရာ၀န္နဲ ့ျပသဖို ့မတြန္ ့ဆုတ္ပါနဲ ့လို ့ေျပာပါရေစ။",
      3,
      3,
      "အေရျပားဆုိင္ရာ က်န္းမာေရး",
      false,
      2,
      1,
      false,
      "https://linyaungchi.com/health-education/10",)
  ];

  _clickFilterButton(BuildContext context) {
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.all(10.0),
                child: new Row(
                  children: <Widget>[
                    new Text('Featured'),
                    new Expanded(child: new Row(children: <Widget>[],)),
                    new RaisedButton.icon(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (_) => new FilterHealthEducationDialogFragment()));
                        },
                        icon: new Icon(
                          Icons.filter_list, color: Colors.grey,),
                        label: new Text("FILTER", style: new TextStyle(
                            fontSize: 14.0, color: Colors.grey),),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ],
                ),
              ),
              new CreateFeatureArticles(),
              new ArticleLists(articles)
            ],
          ),
        ),
      ),

    );
  }


}