import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import '../../shared/response.dart';
import '../../viewmodels/user_viewmodel.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  // Text field state
  String email = '';
  String password = '';

  Widget _registerScreen(BuildContext context, UserViewModel _userViewModel) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: mainColor,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        title: Text('Sign up for the App'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed(signInViewRoute);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Enter email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Enter password'),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Enter a password 6 or more characters long'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.deepOrange[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await _userViewModel.registerWithEmailAndPassword(
                        email, password);
                    if (_userViewModel?.viewModelResponse?.exception == null) {
                      Navigator.of(context)
                          .restorablePushReplacementNamed(mapViewRoute);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    switch (_userViewModel.viewModelResponse.state) {
      case ResponseState.LOADING:
        return Loading();
        break;
      case ResponseState.ERROR:
        if (_userViewModel.viewModelResponse.showToast) {
          Fluttertoast.cancel();
          Fluttertoast.showToast(
            msg: _userViewModel.viewModelResponse.exception,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.red,
            fontSize: 16,
          );
          _userViewModel.viewModelResponse.showToast = false;
        }
        return _registerScreen(context, _userViewModel);
        break;
      case ResponseState.COMPLETE:
      default:
        return _registerScreen(context, _userViewModel);
        break;
    }
  }
}
