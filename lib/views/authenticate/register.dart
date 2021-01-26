import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/full_width_text_btn_with_icon.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';
import 'package:sp_flutter_app/shared/widgets/simple_input_label.dart';
import 'package:sp_flutter_app/shared/widgets/simple_text_input_field.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import '../../shared/response.dart';
import '../../viewmodels/user_viewmodel.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Text field state
  String password1 = '';
  String password2 = '';
  String preferredName = '';
  bool preferredNameError = false;
  bool pwd1Error = false;
  bool pwd2Error = false;

  /*
      Password Must Contain:
      - Minimum 1 Upper case
      - Minimum 1 lowercase
      - Minimum 1 Numeric Number
      - Minimum 1 Special Character
      - Common Allow Character ( ! @ # $ & * ~ )
    */
  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  void handleSubmit() {
    setState(() {
      preferredNameError = false;
      pwd1Error = false;
      pwd2Error = false;
    });
    if (preferredName.isEmpty) {
      setState(() {
        preferredNameError = true;
      });
      return;
    }
    if (password1 != password2 || !isPasswordCompliant(password1)) {
      setState(() {
        pwd1Error = true;
        pwd2Error = true;
      });
      return;
    }
    Navigator.of(context).pushNamed(registerViewRoute);
  }

  void handlePasswordChange(String pwd, bool pwd1) {
    if (pwd1) {
      setState(() {
        password1 = pwd;
      });
    } else {
      setState(() {
        password2 = pwd;
      });
    }
  }

  Widget _registerScreen(BuildContext context, UserViewModel _userViewModel) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldWithGradient(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 2.0,
            vertical: size.height * 0.15,
          ),
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(text: "Register"),
              Padding(
                padding: const EdgeInsets.only(
                  top: kDefaultPadding,
                  bottom: kDefaultPadding,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Using',
                    style: TextStyle(
                      color: Color(0xffadadb2),
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.50,
                    ),
                    children: [
                      TextSpan(
                        text: ' test@domain.coms ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.015,
                        ),
                      ),
                      TextSpan(
                        text: 'to register',
                        style: TextStyle(
                          color: Color(0xffadadb2),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding * 2.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleInputLabel(text: "Preferred Name"),
                    SimpleTextInputField(
                      error: preferredNameError,
                      handleSubmit: handleSubmit,
                      handleChange: (val) {
                        setState(() {
                          preferredName = val;
                        });
                      },
                    ),
                    SimpleInputLabel(text: "Password"),
                    SimpleTextInputField(
                      error: pwd1Error,
                      obscure: true,
                      handleSubmit: handleSubmit,
                      handleChange: (pwd) => handlePasswordChange(pwd, true),
                    ),
                    SimpleInputLabel(text: "Confirm Password"),
                    SimpleTextInputField(
                      error: pwd2Error,
                      obscure: true,
                      handleSubmit: handleSubmit,
                      handleChange: (pwd) => handlePasswordChange(pwd, false),
                    ),
                    SizedBox(height: kDefaultPadding * 2.0),
                    FullWidthTextButtonWithIcon(
                      handleSubmit: handleSubmit,
                      svgAsset: "assets/svgs/envelop.svg",
                      text: "Register with Email",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
