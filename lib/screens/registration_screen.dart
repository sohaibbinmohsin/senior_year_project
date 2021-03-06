import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:senior_year_project/model/user_model.dart';
import 'package:senior_year_project/screens/home_screen.dart';
import 'package:senior_year_project/screens/login_screen.dart';



class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController repasswordController =
      new TextEditingController();

  final _auth = FirebaseAuth.instance;

  EmailAuth emailAuth =
      new EmailAuth(sessionName: "My Switch Sign Up authentication");

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
      recipientMail: emailController.value.text,
      otpLength: 5,
    );
  }

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool _showPassword1 = false;
  void _togglevisibility1() {
    setState(() {
      _showPassword1 = !_showPassword1;
    });
  }

  bool _showCheck = false;
  void _togglevisibility2() {
    setState(() {
      _showCheck = !_showCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    //username field
    final usernameField = TextFormField(
        autofocus: false,
        controller: usernameController,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Username cannot be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid name {Min: 3 char}");
          }
          return null;
        },
        onSaved: (value) {
          usernameController.text = value!;
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
            contentPadding: EdgeInsets.fromLTRB(40, 24, 40, 24),
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            hintText: "Enter Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            )));
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
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
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please enter your password");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid password {Min: 6 char}");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
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
    //Re-enter password field
    final repasswordField = TextFormField(
        autofocus: false,
        controller: repasswordController,
        obscureText: !_showPassword1,
        style: TextStyle(
          // backgroundColor: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'DMSans',
          color: Colors.white,
        ),
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (passwordController.text != value) {
            return "Passwords dont match";
          }
          return null;
        },
        onSaved: (value) {
          repasswordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff053275),
            suffixIcon: GestureDetector(
              onTap: () {
                _togglevisibility1();
              },
              child: Icon(
                _showPassword1 ? Icons.visibility : Icons.visibility_off,
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
            hintText: "Re-Enter Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            )));
    //Signup
    final signupButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xff053275),
        child: ElevatedButton(
          onPressed: () {
            signUp(emailController.text, passwordController.text);
          },
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
                              "Getting Started",
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
                              "Let's create your account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'DMSans',
                                color: Colors.white,
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 38,
                      ),
                      emailField,
                      SizedBox(
                        height: 40,
                      ),
                      usernameField,
                      SizedBox(
                        height: 40,
                      ),
                      passwordField,
                      SizedBox(
                        height: 40,
                      ),
                      repasswordField,
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _togglevisibility2();
                            },
                            child: Icon(
                              _showCheck
                                  ? Icons.check_box_outlined
                                  : Icons.check_box_outline_blank,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                              child: Text(
                            "By creating an account, you agree to our ",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )),
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Terms & Conditions",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      signupButton,
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                "Sign In",
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      if (!_showCheck) {
        Fluttertoast.showToast(msg: "Please accept our terms & conditions");
        return;
      }
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    //calling our usermodel
    UserModel userModel = UserModel();
    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameController.text;
    //sending these values
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :)");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
