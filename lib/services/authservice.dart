import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  //handle auth
  handleauth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext buildContext, snapshot) {
        if (snapshot.hasData) {
          // return HomeScreen();
        } else {
          // return LoginWithOtp();
        }
      },
    );
  }

  //sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //sign in
  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: smsCode,
    );
    signIn(authCredential);
  }
}
