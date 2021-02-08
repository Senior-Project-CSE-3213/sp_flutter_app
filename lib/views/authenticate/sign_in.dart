import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/full_width_text_btn_with_icon.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';
import 'package:sp_flutter_app/shared/widgets/simple_input_label.dart';
import 'package:sp_flutter_app/shared/widgets/simple_text_input_field.dart';
import 'package:sp_flutter_app/utils/helpers.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import '../../shared/response.dart';
import '../../viewmodels/user_viewmodel.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Text field state
  String password = '';
  String email = '';
  bool emailError = false;
  bool pwdError = false;

  bool handleSubmit() {
    setState(() {
      emailError = false;
      pwdError = false;
    });
    if (email.isEmpty) {
      setState(() {
        emailError = true;
      });
      return false;
    }
    if (!isPasswordCompliant(password)) {
      setState(() {
        pwdError = true;
      });
      return false;
    }
    return true;
  }

  void handlePasswordChange(String pwd) {
    setState(() {
      password = pwd;
    });
  }

  Widget _registerScreen(BuildContext context, UserViewModel _userViewModel) {
    final UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return ScaffoldWithGradient(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2.0,
              vertical: size.height * 0.15,
            ),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(text: "Sign In"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 2.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleInputLabel(text: "Email"),
                      SimpleTextInputField(
                        error: emailError,
                        handleSubmit: handleSubmit,
                        handleChange: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SimpleInputLabel(text: "Password"),
                      SimpleTextInputField(
                        error: pwdError,
                        obscure: true,
                        handleSubmit: handleSubmit,
                        handleChange: (pwd) => handlePasswordChange(pwd),
                      ),
                      SizedBox(height: kDefaultPadding * 2.0),
                      FullWidthTextButtonWithIcon(
                        handleSubmit: ({success}) async {
                          if (handleSubmit()) {
                            await _userViewModel.signInWithEmailAndPassword(
                                email, password);
                          }
                        },
                        svgAsset: "assets/svgs/envelop.svg",
                        text: "Sign In with Email",
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
