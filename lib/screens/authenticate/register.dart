import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/loading.dart';
import 'package:sp_flutter_app/shared/response.dart';
import 'package:sp_flutter_app/viewmodels/user_viewmodel.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

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
              widget.toggleView();
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
                    setState(() => loading = true);
                    await _userViewModel.registerWithEmailAndPassword(
                        email, password);
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
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
        setState(() {
          error = _userViewModel.viewModelResponse.exception;
        });
        return _registerScreen(context, _userViewModel);
        break;
      case ResponseState.COMPLETE:
      default:
        return _registerScreen(context, _userViewModel);
        break;
    }
  }
}
