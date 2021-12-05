import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController box1Controller = new TextEditingController();
  final TextEditingController box2Controller = new TextEditingController();
  final TextEditingController box3Controller = new TextEditingController();
  final TextEditingController box4Controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final box1Field = TextFormField(
        autofocus: false,
        controller: box1Controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        onSaved: (value) {
          box1Controller.text = value!;
        },
        style: TextStyle(
          // backgroundColor: Colors.blue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'DMSans',
          color: Colors.white,
        ),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff053275),
            // prefixIcon: Icon(Icons.mail_rounded),
            contentPadding: EdgeInsets.fromLTRB(40, 24, 40, 24),
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            hintText: "_",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            )));
    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xff053275),
        child: ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.login_rounded,
            color: Colors.white,
            size: 30,
          ),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              primary: const Color(0xff053275), // <-- Button color
              onPrimary: Colors.yellow // <-- Splash color
              ),
        ));

    return Scaffold(
        backgroundColor: const Color(0xFFEBE332),
        body: Center(
          child: SingleChildScrollView(
              child: Container(
                  child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "OTP",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36,
                                      fontFamily: 'DMSans',
                                      color: const Color(0xff053275),
                                    ),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Authentication",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36,
                                      fontFamily: 'DMSans',
                                      color: const Color(0xff053275),
                                    ),
                                  )
                                ]),
                            SizedBox(
                              height: 45,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "An authentication code has",
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'DMSans',
                                      color: const Color(0xff053275),
                                    ),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "been send to your email",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: 'DMSans',
                                      color: const Color(0xff053275),
                                    ),
                                  )
                                ]),
                            SizedBox(
                              height: 107,
                            ),
                            box1Field,
                            SizedBox(
                              height: 90,
                            ),
                            loginButton,
                            SizedBox(
                              height: 55,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Resend authentication code?",
                                      style: TextStyle(
                                        color: const Color(0xff053275),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ))
                              ],
                            )
                          ])),
                    ))),
                  ));
  }
}
