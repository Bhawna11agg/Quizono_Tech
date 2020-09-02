import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizono/services/authservice.dart';

class LoginWithOtp extends StatefulWidget {
  @override
  _LoginWithOtpState createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  bool x = false;
  String phoneNumber;
  String verificationId, smsCode;
  bool codeSent = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // to avoid issues in displaying widgets
      left: true,
      top: true,
      right: true,
      bottom: true,
      child: new Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: new Column(children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
            //   child: Container(
            //     height: 500.0,
            //     width: 500.0,
            //     child: new Image.asset(
            //         // image link
            //         ),
            //   ),
            // ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: new Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                new Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(35.0, 45.0, 0.0, 35.0),
                    width: 350,
                    child: new TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: const Icon(
                          Icons.call,
                          color: Colors.black,
                        ),
                        hintText: 'Mobile Number',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        this.phoneNumber = value;
                      },
                    ),
                  ),
                  codeSent
                      ? Container(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 45.0, 0.0, 35.0),
                          width: 350,
                          child: new TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              border: UnderlineInputBorder(),
                              filled: true,
                              icon: const Icon(
                                Icons.call,
                                color: Colors.black,
                              ),
                              hintText: 'OTP',
                            ),
                            keyboardType: TextInputType.number,
                            onSaved: (String value) {
                              this.smsCode = value;
//                   person.email = value;
                            },
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80.0, 10.0, 30.0, 150.0),
                    child: SizedBox(
                      width: 250,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.deepOrange),
                        ),
                        onPressed: () {
                          codeSent
                              ? AuthService()
                                  .signInWithOTP(smsCode, verificationId)
                              : verifyPhone(phoneNumber);
                          //  Navigator.of(context).pushReplacementNamed('/dashboard');
                        },
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                        child: codeSent ? Text("Get OTP") : Text("Get OTP"),
                      ),
                    ),
                  ),
                ]),
              ]),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNumber) async {
    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential authCredential) {
      AuthService().signIn(authCredential);
    };
    final PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authException) {
      print('$authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
