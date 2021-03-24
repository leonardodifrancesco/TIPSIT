import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_flutter/signIn/login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(     future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text("An error has occured");
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
        
          return MaterialApp(
            title: 'Flutter Login',
            theme: ThemeData(
            primarySwatch: Colors.blue,
            ),
            home: LoginPage(),
          );
        }

        return SimpleDialog(
          key: key,
          backgroundColor: Colors.black54,
          children: <Widget>[
            Center(
              child: Column(children: [
                CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text("loading...",style: TextStyle(color: Colors.blueAccent),)
                ]),
            )
          ]
        );
      },
    );
  }
}