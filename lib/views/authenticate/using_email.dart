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

class UsingEmail extends StatefulWidget {
  @override
  _UsingEmailState createState() => _UsingEmailState();
}

class _UsingEmailState extends State<UsingEmail> {
  // Text field state
  String email = '';
  bool error = false;

  void handleSubmit({dynamic success}) {
    if (!error && EmailValidator.validate(email)) {
      // call success function
      if (success != null && success is Function) success();
    }
    // otherwise maybe shake the input button?
    setState(() {
      error = true;
    });
  }

  void handleEmailChange(String changedEmail) {
    if (!EmailValidator.validate(changedEmail)) {
      setState(() {
        error = true;
        email = changedEmail;
      });
    } else {
      setState(() {
        error = false;
        email = changedEmail;
      });
    }
  }

  Widget _registerScreen(BuildContext context, UserViewModel _userViewModel) {
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
                HeadingText(text: "What's your email address?"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 2.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleInputLabel(text: "Your Email"),
                      SimpleTextInputField(
                        error: error,
                        handleSubmit: handleSubmit,
                        handleChange: handleEmailChange,
                      ),
                      SizedBox(height: kDefaultPadding * 2.0),
                      FullWidthTextButtonWithIcon(
                        handleSubmit: ({success}) {
                          handleSubmit(
                            success: () => {
                              _userViewModel.registrationEmail = email,
                              Navigator.of(context)
                                  .pushNamed(registerViewRoute, arguments: {
                                email: email,
                              }),
                            },
                          );
                        },
                        svgAsset: "assets/svgs/envelop.svg",
                        text: "Continue with Email",
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
