import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:lyc_clinic/ui/comment/widget/create_comment_items.dart';
import 'package:lyc_clinic/ui/comment/page/comment_page.dart';

class ArticleDetailsItem extends StatefulWidget {

  @override
  ArticleDetailsItemState createState() {
    return new ArticleDetailsItemState();
  }
}

class ArticleDetailsItemState extends State<ArticleDetailsItem> {

  _clickComment(BuildContext context) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (_) => new CommentPage()));
  }

  _createArticleDetailsWidgets() {
    return new Container(
        child: new Stack(
          children: <Widget>[
            new Column(
                children: <Widget>[
                  new Text('Header Title Descrioption', style: new TextStyle(
                      fontSize: MyStyle.large_fontSize,
                      fontWeight: FontWeight.bold),),
                  new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Row(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Padding(padding: const EdgeInsets.all(5.0),
                                    child: new Icon(
                                        Icons.favorite, color: Colors.grey,
                                        size: 18.0)),
                                new Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: new Text('0', style: new TextStyle(
                                        color: Colors.grey,
                                        fontSize: MyStyle.small_fontSize),)),
                              ],
                            ),

                            new Row(
                              children: <Widget>[
                                new Padding(padding: const EdgeInsets.all(5.0),
                                    child: new Icon(
                                        Icons.chat_bubble, color: Colors.grey,
                                        size: 18.0)),
                                new Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: new Text('1', style: new TextStyle(
                                        color: Colors.grey,
                                        fontSize: MyStyle.small_fontSize),)),
                              ],
                            ),

                            new Row(
                                children: <Widget>[
                                  new Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: new Icon(
                                          Icons.share,
                                          color: Colors.grey,
                                          size: 18.0)
                                  ),
                                  new Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5.0),
                                      child: new Text('0', style: new TextStyle(
                                          color: Colors.grey,
                                          fontSize: MyStyle.small_fontSize),)),
                                ]
                            )
                          ]
                      )
                  ),
                  new Text(
                      'အပူလွဳိင္းကလည္းျဖတ္စျပဳေနျပီဆိုေတာ့ အပူမိတာေတြအပူရွပ္တာေတြ ျဖစ္လာနိုင္တာေပါ့ေနာ္။ ဒါ့ေျကာင့္မို ့လို ့အပူနဲ့ပတ္သတ္ျပီးျဖစ္လာနိုင္တဲ့ က်န္းမာေရးအေျကာင္းေလးေတြေျပာျပခ်င္ပါတယ္။ အပူလွဳိင္းျဖတ္ျပီဆိုလ်ွင္ အပူမိတတ္ပါတယ္။ အေအးမိတာဆိုရွိသလို အပူမိတာလည္းရွိတယ္လို ့ဆိုရမွာေပါ့ေနာ္။ အပူမိသြားျပီဆိုတာကုိဘယ္လိုသိနိုင္မလဲ။ လူေတာ္ေတာ္မ်ားမ်ားကသိျကပါတယ္။ အပူရွပ္တယ္ဆိုျပီးေျပာေလ့ရွိျကတယ္။ အပူရွပ္ျပီဆိုလ်ွင္ လူခႏၶာကုိယ္ဟာ ေရဓာတ္ဆားဓာတ္ေတြ က်ကုန္ပါတယ္။ အဲ့လိုျဖစ္လာတာနဲ့ ေအာက္ပါလကၡဏာေတြျဖစ္လာပါေတာ့တယ္။ ၁၊၊ ခႏၶာကိုယ္ပူအန္းအန္းျဖစ္ျခင္း ၂၊၊ ေခါင္းကုိက္ျခင္း ၃၊၊ မူးေဝလာျခင္း ၄၊၊ မူးေမ့လဲျခင္း ၅၊၊ ေခြ်းအရမ္းထြက္ျခင္း ၆၊၊ ေရအလြန္ဆာျခင္း&nbsp; ၇၊၊ ေသြးခုုန္နွဳန္းျမန္ျခင္း&nbsp; ၈၊၊ ဆီးမသြားေတာ့ျခင္း&nbsp; ၉၊၊ ဆီးအေရာင္ေနွာက္ျခင္း ၁၀။ ေသြးခုန္နွဳန္းျမန္လာျခင္း ၁၁၊၊ အန္ျခင္း ၁၂၊၊ ဝမ္းေလ်ာျခင္း ၁၃၊၊ ျဖဴေဖ်ာ့လာျခင္း&nbsp; ၁၄၊၊ ၾကြက္တက္ျခင္း ထိုကဲ့သို ့ျဖစ္လာမယ္ဆိုလ်ွင္ အျမန္ဆံုးကုသရပါမယ္။ မကုသဘူးဆိုလ်ွင္ Heat Stroke လို့ေခၚတဲ့ ကုိယ္အပူခ်ိန္ အလြန္အင္မတန္ တက္လာျပီး ေနာက္ပိုင္း ဦးေနွာက္/ေက်ာက္ကပ္/နွလံုး/အသည္း/အဆုတ္ ထိခုိက္ျပီး အသက္ဆံုးရွဳံးနိုင္ပါတယ္။ Heat Stroke ရဲ ့လကၡဏာေတြကေတာ့ ၁၊၊ ကိုယ္ပူခ်ိန္ ၁၀၄ ဒီဂရီ ဖာရင္ဟိုက္ထက္ ျမွင့္တက္လာျခင္း&nbsp; ၂၊၊ ေခါင္းအလြန္ကိုက္ျခင္း&nbsp; ၃၊၊ မူးေဝျခင္း&nbsp; ၄၊၊ အသားအရည္မ်ားနီရဲ လာျခင္း&nbsp; ၅၊၊ အပူရွပ္သည့္အဆင့္ တြင္ ေခ်ြးတအားထြက္ေသာ္လည္း ယခုအဆင့္တြင္မူ ေခ်ြးလံုးဝတိတ္ကာ ေျခာက္ခမ္းပူေလာင္ေနတတ္သည္။ ၆၊၊ အပူရွိန္လြန္ကာတက္ျခင္း ၇၊၊ အသက္ရွဳနွဳန္းျမန္လာျခင္း ၈၊၊ ကေယာင္ကယမ္းျဖစ္ျခင္း ၉ ၊၊ အလြန္အန္ျခင္း အထက္ပါ လကၡဏာေတြျပလာျပီ ဆို လ်ွင္ ေဆးရုံ ေဆးခန္း အျမန္သြားရပါမယ္။ ေဆးရုုံ ေဆးခန္းမေရာက္မီ အေရးျကီးတဲ့ အခ်က္ကေလးေတြလုပ္ထားရပါမယ္။ ၁) ေအးျမတဲ့ေနရာကို ေ၇ြ ့ ့ေနရပါမယ္။ ၂) ဓာတ္ဆားရည္ (သို ့မဟုတ္)ရုိးရုိး ေရ ကို မ်ားမ်ားေသာက္ရပါမယ္။ ေကာ္ဖီ လက္ဖက္ရည္ စတဲ့ ကဖင္းဓာတ္ပါတာေတြကိုေတာ့မေသာက္သင့္ပါဘူး။ ၃) မလိုအပ္တ့ဲ အက်ၤ ီ အထူေတြကို ခ်ြတ္ျပီး လြတ္လပ္ေပါ့ပါးေအးျမေသာအက်ၤ ီေလးေတြ၀တ္ရပါမယ္။ ၄) ေအးျမတဲ့ေနရာမွာနားျပီးတဲ ့ေနာက္မွာအပူဓာတ္ေလ်ာ့ေအာင္ ေရပတ္တိုက္ျခင့္္္း၊ ပန္ကာေလေအးခံ့္ျခင္း၊ air con ျဖင့္ေနျခင္းျဖင့္ အပူဓာတ္ေလ်ာ့ေအာင္ ျပဳလုပ္ရပါမယ္။ ထို သို ့လုပ္ေပးပါက ၁၅ မိနစ္ မိနစ္၃၀ အတြင္း သက္သာ သြားနိုင္ေပမယ့္ထပ္ျပီးေနာက္ဆက္တြဲြေတြေဆးရုံေဆးခန္းေတာ့ သြားျဖစ္ေအာင္သြားပါလို ့တိုက္တြန္းပါရေစရွင္။ အပူအားျကီးတာေျကာင့္ သတိလစ္ေနသူကိုလည္း အေရးေပၚ ကားမလာခင္မွာ အထက္ပါနည္းေတြအတိုင္း ျပဳစုေပးထားသင့္ပါတယ္။ သတိလစ္ေနသူကုိေတာ့ ဓာတ္ဆားရည္၊ ေရစတာေတြကို ဇြတ္တိုက္မထားသင့္ပါဘူး။ အပူဒဏ္ အႏၲရာယ္အတြက္ကာကြယ္ဖို ့ကေတာ့ အထက္မွာေဖာ္ျပသလို ၁၊၊ ေနပူကုိတတ္နိုင္သမ်ွ ေရွာင္သင့္တာေတာမေျပာလည္း့သိျပီးျဖစ္မွာပါ။ ၂၊၊ မျဖစ္မေနေနပူထဲသို ့ သြားမယ္ဆိုပါက အမိုးအကာအေဆာင္းေတြနွင့္သြားပါ။ ၃၊၊ အဝတ္အစားေခ်ာင္ေခ်ာင္ ခ်ိခ်ိေလးေတြ ဝတ္ပါ။ ၄၊၊ေခ်ြးထြက္မ်ားပါက ဓာတ္ဆားရည္ေသာက္ပါ။ ေရမ်ားမ်ားေသာက္ပါ။ ၅၊၊ ေလ့က်င့္ခန္းလုပ္ ေနသူမ်ားအေနျဖင့္ အလြန္ပူျပင္းတဲ့အခ်ိန္မွာျပင္းထန္တဲ့ ေလ့က်င့္ခန္းေတြေရွာင္သင့္ပါတယ္။ အားလံုးပဲ ပူျပင္းတဲ့ ရာသီဥတုျကီးကုိအႏၲရာယ္ကင္းေဘးကင္းစြာနဲ့ျဖတ္သန္းနိုင္ျကပါေစ။ Credit- ေဒါက္တာ ေဒၚထူးထုုိက္ထုု'),
                ]
            ),
            new Positioned(
              child: _floatingBar(),
              bottom: 20.0,
              left: 5.0,
              right: 5.0,)
          ],
        )

    );
  }

  Widget _getFloatButton(IconData ic, Color bgColor, Color icColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          boxShadow: [new BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              offset: new Offset(1.0, 4.0)
          ),
          ]
      ),
      child: new Icon(ic, color: icColor,),
    );
  }

  Widget _floatingBar() {
    return new Container(
        alignment: FractionalOffset.bottomCenter,
        child: new Row(
          children: <Widget>[
            new InkWell(
              child: new Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 0.0, right: 10.0),
                child: _getFloatButton(
                    Icons.chat_bubble_outline, Colors.white, Colors.grey),
              ),
              onTap: null,
            ),
            new Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, left: 5.0),
                child: new Text('2', style: new TextStyle(
                    fontSize: MyStyle.small_fontSize,
                    color: Colors.grey),)
            ),
            new Expanded(
                child: new Row(children: <Widget>[],)),
            new RaisedButton(
              onPressed: () => _clickComment(context),
              color: Colors.orange,
              child: new Text('Comment  ေပးရန္',
                style: new TextStyle(
                  color: Colors.white,),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(
                    30.0),),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _createArticleDetailsWidgets(),
            new CommentItem(),
          ],
        )
    );
  }
}