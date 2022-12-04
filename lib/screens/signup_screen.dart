import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  Widget _buildSinginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          ).then((value) {
            print("Created New Account");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>HomeScreen()));
          }).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white,
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                _buildUserName(_usernameController),
                const SizedBox(height: 20),
                _buildEmail(_emailController),
                const SizedBox(height: 20),
                _buildPassword(_passwordController),
                const SizedBox(height: 20),
                _buildSinginBtn(),
              ],
            ),
          ),
        )
      ),
    );
  }
}

Widget _buildUserName(TextEditingController controller) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: kBoxDecorationStyle,
    height: 60.0,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      style: TextStyle(
        color: Colors.white,
        fontFamily: "OpenSans",
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14.0),
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
        hintText: "Enter your name",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

Widget _buildEmail(TextEditingController controller) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: kBoxDecorationStyle,
    height: 60.0,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
        fontFamily: "OpenSans",
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14.0),
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.white,
        ),
        hintText: "Enter your Email",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

Widget _buildPassword(TextEditingController controller) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: kBoxDecorationStyle,
    height: 60.0,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        color: Colors.white,
        fontFamily: "OpenSans",
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14.0),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.white,
        ),
        hintText: "Enter your Password",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}


