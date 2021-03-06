import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/Allscreens/loginScreen.dart';
import 'package:uber_clone/Allscreens/registrationScreen.dart';
import 'package:uber_clone/Allscreens/mainscreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Rider app',
      theme: ThemeData(
        // fontFamily: "Signatra",
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.idScreen,
      routes: {
        RegistrationScreen.idScreen:(context) => RegistrationScreen(),
        LoginScreen.idScreen:(context) => LoginScreen(),
        MainScreen.idScreen:(context) => MainScreen(),
      },
    );
  }
}
