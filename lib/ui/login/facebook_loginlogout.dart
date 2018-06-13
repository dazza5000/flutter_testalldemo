import 'dart:async';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookLoginLogot {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String _message = 'Log in/out by pressing the buttons below.';

  static Future<Null> _login() async {
    final FacebookLoginResult result =
        await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('Login In With Token${accessToken.token} User Id:${accessToken
            .userId} Permission:${accessToken.permissions}');
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }

  static Future<Null> _logOut() async {
    await facebookSignIn.logOut();

  }
}
