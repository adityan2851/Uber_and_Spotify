import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/AllWidgets/progessDialog.dart';
import 'package:uber_clone/Allscreens/registrationScreen.dart';

import '../main.dart';
import 'mainscreen.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key key}) : super(key: key);
  static const String idScreen = "Login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              Image(
                image: AssetImage("images/logo.png"),
                width: 250.0,
                height: 200.0,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.0,),
              Text(
                "Logged in as Rider",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height: 1.0,),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "email",
                        labelStyle: TextStyle(fontSize: 14.0, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(fontSize: 10.0, color:Colors.grey)
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 1.0,),
                  TextField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "password",
                        labelStyle: TextStyle(fontSize: 14.0, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(fontSize: 10.0, color:Colors.grey)
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.amberAccent,
                    textColor: Colors.white,
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18, fontFamily:"Brand Bold"),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0),
                    ),
                    onPressed: ()
                    {
                      if (!emailTextEditingController.text.contains("@")){
                    displayToastMessage("Enter the valid email", context);
                    }
                      else if (passwordTextEditingController.text.length < 6){
                        displayToastMessage("Enter the valid password", context);
                    }
                      else
                        loginUser(context);
                    },
                  )
                ],
              ),
              ),
              FlatButton(onPressed: ()
              {
                Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);
              },
                child: Text(
                  "Do not have a account? Register",
                  style: TextStyle(fontFamily: "Brand Bold"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginUser(BuildContext context) async{
    showDialog(context: context,
        barrierDismissible: false, 
        builder:(BuildContext context){
          sleep(const Duration(seconds: 5));
          return ProgessDialog(message: "Authenicating! Please Wait",);
        }
    );
    final User firebaseUser =(await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text)
        .catchError((errMsg){
          Navigator.pop(context);
      displayToastMessage("Error"+ errMsg.toString(), context);
    })).user;
    if (firebaseUser != null){

    userRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
      if (snap.value != null){
        Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
        displayToastMessage("You are Logged-in", context);
      }
      else {
        Navigator.pop(context);
        _firebaseAuth.signOut();        
        displayToastMessage("No record Found", context);
      }
    });
    }
    else{
      Navigator.pop(context);
      displayToastMessage("Error has occured, cannot be signed in", context);
    }
  }
}
