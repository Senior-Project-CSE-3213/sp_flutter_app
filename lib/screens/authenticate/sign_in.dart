import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthService>(context);
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        title: Text('Sign in to App'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: SingleChildScrollView(
          child: RaisedButton(
            child: Text('Sign in anonymously'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('ERROR');
                AlertDialog(
                  title: Text('Error Signing In'),
                  content: Text('There was an error when trying to sign in anonymously'),
                );
              } else {
                print(result.uid);
              }
            }
          )
        ),
      ),
    );
  }
}
