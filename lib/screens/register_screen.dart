import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  SharedPreferences sharedPreferences;
  bool isLoading = false;
  final _firestore = Firestore.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  String email = '';
  String password = '';
  String gender = 'male';
  String fullName = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  fullName = value;
                },
                textAlign: TextAlign.center,
                controller: nameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    hintText: 'Enter Your Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                textAlign: TextAlign.center,
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    hintText: 'Enter Your Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text('Male'),
                    Radio(
                      value: 'male',
                      groupValue: gender,
                      onChanged: (String val) {
                        setState(() {
                          gender = 'male';
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Female'),
                    Radio(
                      value: 'female',
                      groupValue: gender,
                      onChanged: (String val) {
                        setState(() {
                          gender = 'female';
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                color: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      _firestore.collection('users').add({
                        'name': fullName,
                        'gender': gender,
                        'email': email,
                        'photoURL': ''
                      });
//                      sharedPreferences = await SharedPreferences.getInstance();
//                      await sharedPreferences.setString('name', fullName);
//                      await sharedPreferences.setString('email', email);
//                      await sharedPreferences.setString('gender', gender);
//                      await sharedPreferences.setString('photoURL', '');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    }
                  } catch (error) {
                    Fluttertoast.showToast(
                        msg: 'Email or password is incorrect');
                  }
                  setState(() {
                    isLoading = false;
                  });
                  emailController.clear();
                  passwordController.clear();
                },
                child: Text('Sign Up'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 50,
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: Text('Sign In'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
