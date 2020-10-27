import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_flutter_app/screens/login/login_screen.dart';
import 'package:sp_flutter_app/screens/signup/components/background.dart';
import 'package:sp_flutter_app/widgets/already_have_an_account_acheck.dart';
import 'package:sp_flutter_app/widgets/rounded_button.dart';
import 'package:sp_flutter_app/widgets/rounded_input_field.dart';
import 'package:sp_flutter_app/widgets/rounded_password_field.dart';
import 'package:sp_flutter_app/services/auth.dart';

class Body extends StatefulWidget {
  final Function toggleView;

  Body({this.toggleView});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _error = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return _loading
        ? Center(child:CircularProgressIndicator())
        : Background(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "SIGNUP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/svgs/undraw_nature_fun.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.05),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    RoundedInputField(
                      hintText: "Your Email",
                      validator: (value) =>
                      value.isEmpty ? 'Please enter an email' : null,
                      onChanged: (value) =>
                          setState(() => _email = value),
                    ),
                    RoundedPasswordField(
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return 'Please enter a password at least 6 characters long';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          setState(() => _password = value),
                    ),
                    RoundedButton(
                      text: "SIGNUP",
                      press: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => _loading = true);
                          dynamic result =
                          await _auth.registerWithEmailAndPassword(
                              _email, _password);
                          if (result == null) {
                            setState(() {
                              _error =
                              'Error with signing up. Check email and password';
                              _loading = false;
                            });
                          }
                          // TODO: This is used for now. The StreamProvider in the main.dart file is supposed to handle this, but isn't for this case
                          Navigator.of(context).pushNamed('/event_map');
                        }
                      },
                    ),
                  ]),
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  _error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}