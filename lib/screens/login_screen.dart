import 'package:flutter/material.dart';
import './registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        // validator: ,
        onSaved: (value) {
          emailController.text = value!;
        },
        style: TextStyle(
          // backgroundColor: Colors.blue,
          fontSize: 20,
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
            hintText: "Enter Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            )));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: !_showPassword,
        style: TextStyle(
          // backgroundColor: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'DMSans',
          color: Colors.white,
        ),
        // validator: ,
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff053275),
            suffixIcon: GestureDetector(
              onTap: () {
                _togglevisibility();
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                size: 31,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(40, 24, 40, 24),
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            hintText: "Enter Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
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
        backgroundColor: Colors.black,
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
                              "Welcome Back",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                fontFamily: 'DMSans',
                                color: Colors.white,
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
                              "Let's Sign You In!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'DMSans',
                                color: Colors.white,
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 85,
                      ),
                      emailField,
                      SizedBox(
                        height: 40,
                      ),
                      passwordField,
                      SizedBox(
                        height: 65,
                      ),
                      loginButton,
                      SizedBox(
                        height: 42,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.white,
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
