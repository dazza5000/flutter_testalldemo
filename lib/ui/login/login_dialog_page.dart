import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyc_clinic/ui/login/presenter/login_presenter.dart';
import 'package:lyc_clinic/ui/login/contract/login_contract.dart';
import 'package:lyc_clinic/ui/login/data/account.dart';
import 'package:lyc_clinic/utils/mySharedPreferences.dart';
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/main.dart';

class LoginDialogPage extends StatefulWidget {
  @override
  LoginDialogPageState createState() {
    return new LoginDialogPageState();
  }
}

class LoginDialogPageState extends State<LoginDialogPage>
    implements LoginContract {
  var facebookLogin = new FacebookLogin();
  var result;
  String _message = 'Log in/out by pressing the buttons below.';
  LoginPresenter mPresenter;
  Account account;
  bool isLogin = false;
  String btnTitle;
  MySharedPreferences sharedPreferences = new MySharedPreferences();

  LoginDialogPageState() {
    mPresenter = new LoginPresenter(this);
  }

  void loginlogoutFacebook() async {
    if (!isLogin) {
      result = await facebookLogin.logInWithReadPermissions(['email']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          //_sendTokenToServer(result.accessToken.token);
          //_showLoggedInUI();
          final FacebookAccessToken accessToken = result.accessToken;
          mPresenter.sendAccessToken(accessToken.token);
          _showMessage('''
         Logged in!
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
          break;

        case FacebookLoginStatus.cancelledByUser:
          _showMessage('Login cancelled by the user.');
          break;
        case FacebookLoginStatus.error:
          _showMessage('Something went wrong with the login process.\n'
              'Here\'s the error Facebook gave us: ${result.errorMessage}');

          break;
      }
    } else {
      facebookLogin.logOut().then((_) => sharedPreferences.clear());
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
      print(_message);
    });
  }

  Widget _facebookButton() {
    btnTitle = isLogin ? 'Logout' : 'Continue with Facebook';
    return new Container(
      height: 50.0,
      margin:
          const EdgeInsets.only(left: 4.0, top: 30.0, right: 4.0, bottom: 4.0),
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
      child: new Stack(
        children: <Widget>[
          new Align(
            alignment: FractionalOffset.centerLeft,
            child: new Icon(
              FontAwesomeIcons.facebookSquare,
              color: MyStyle.colorWhite,
            ),
          ),
          new Center(
            child: new MaterialButton(
              child: new Text(
                btnTitle,
                style: MyStyle.buttonTextStyle(),
              ),
              onPressed: loginlogoutFacebook,
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
          color: MyStyle.colorFB, borderRadius: new BorderRadius.circular(4.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: new Column(
        children: <Widget>[
          new Text(
            'Register now to continue',
            style: new TextStyle(
                fontSize: MyStyle.xmedium_fontSize, color: MyStyle.colorBlack),
            textAlign: TextAlign.center,
          ),
          _facebookButton(),
        ],
      ),
    );
  }

  @override
  void saveDataToPrefs(Account a) {
    setState(() {
      this.account = a;
      isLogin = true;
      print("Account Dat a>>${account.toString()}");
      sharedPreferences.putStringData(
          Configs.PREF_USER_ACCESSCODE, account.accessCode);
      sharedPreferences.putStringData(Configs.PREF_USER_NAME, account.name);
      sharedPreferences.putStringData(Configs.PREF_USER_IMAGE, account.image);
      sharedPreferences.putBooleanData(Configs.PREF_USER_LOGIN, true);
    });
  }

  @override
  void showLandingPage() {
    print('Show Landing Page');
    runApp(new MyApp());
  }
}
