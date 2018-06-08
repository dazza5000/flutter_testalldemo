/*
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:lyc_clinic/base/mystyle.dart';

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

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.black12,
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          color: MyStyle.colorWhite,
          child: new Column(
            children: <Widget>[
              new Text('Register now to continue'),
              new Expanded(
                  child: new MaterialButton(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: new Text(
                  'Continue with Facebook',
                  style: new TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                onPressed: logiWithFacebook,
                color: Colors.blueAccent,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
*/
