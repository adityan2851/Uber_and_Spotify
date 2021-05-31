import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_clone/AllWidgets/progessDialog.dart';
import 'package:uber_clone/Allscreens/loginScreen.dart';
import 'package:uber_clone/Allscreens/mainscreen.dart';
import 'package:uber_clone/main.dart';

class RegistrationScreen extends StatelessWidget {
  // const RegistrationScreen({Key key}) : super(key: key);
  static const String idScreen = "Register";
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
                "Register as Rider",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "name",
                          labelStyle: TextStyle(fontSize: 14.0, fontFamily: "Brand Bold"),
                          hintStyle: TextStyle(fontSize: 10.0, color:Colors.grey)
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
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
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "phone number",
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
                            "Create Account",
                            style: TextStyle(fontSize: 18, fontFamily:"Brand Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: ()
                      {
                        if (nameTextEditingController.text.length < 4){
                          displayToastMessage("Your name should be more than 3 letters", context);
                        }
                        else if (!emailTextEditingController.text.contains("@")){
                          displayToastMessage("Enter the valid email", context);
                        }
                        else if (phoneTextEditingController.text.length != 10){
                          displayToastMessage("Enter the valid phone number", context);
                        }
                        else if (passwordTextEditingController.text.length < 6){
                          displayToastMessage("Enter the valid password", context);
                        }
                        else {
                          registerNewUser(context);
                        }
                      },
                    )
                  ],
                ),
              ),
              FlatButton(onPressed: ()
              {
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);              },
                child: Text(
                  "Already have an account? Login Here",
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


  void registerNewUser(BuildContext context) async {
    showDialog(context: context,
        barrierDismissible: false,
        builder:(BuildContext context){
          return ProgessDialog(message: "Registering.. Please Wait!!",);
        }
    );
    final User firebaseUser =(await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text)
    .catchError((errMsg){
      displayToastMessage("Error"+ errMsg.toString(), context);
    })).user;

    if (firebaseUser != null){
      Map userDataMap = {
        "name" : nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Congratulations Your Account has been created", context);
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    }
    else{
      displayToastMessage("User has not created", context);
    }
  }
}
void displayToastMessage(String message, BuildContext context)
{
  Fluttertoast.showToast(msg: message);
}