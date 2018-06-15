import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginDialogPage extends StatefulWidget {
  @override
  LoginDialogPageState createState() {
    return new LoginDialogPageState();
  }
}

class LoginDialogPageState extends State<LoginDialogPage> {
  var facebookLogin = new FacebookLogin();
  var result;
  String _message = 'Log in/out by pressing the buttons below.';

  void logiWithFacebook() async {
    result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        //_sendTokenToServer(result.accessToken.token);
        //_showLoggedInUI();
        final FacebookAccessToken accessToken = result.accessToken;
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
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Widget _facebookButton() {
    return new Positioned(
        bottom: 0.0,
        //alignment: FractionalOffset.bottomCenter,
        child: new Container(
          height: 40.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
          padding: const EdgeInsets.all(5.0),
          child: new Row(
            children: <Widget>[
              new Icon(
                FontAwesomeIcons.facebookSquare,
                color: MyStyle.colorWhite,
              ),
              new Center(
                child: new MaterialButton(
                  child: new Text(
                    'Continue with Facebook',
                    style: MyStyle.buttonTextStyle(),
                  ),
                  onPressed: null,
                ),
              )
            ],
          ),
          decoration: new BoxDecoration(
              color: MyStyle.colorFB,
              borderRadius: new BorderRadius.circular(4.0)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Padding(
          padding: const EdgeInsets.all(0.0),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 10.0),
                  height: 100.0,
                  color: MyStyle.colorWhite,
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          'Register now to continue',
                          style: MyStyle.headerStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      _facebookButton(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
