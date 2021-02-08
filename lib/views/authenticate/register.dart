import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/full_width_text_btn_with_icon.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';
import 'package:sp_flutter_app/shared/widgets/simple_input_label.dart';
import 'package:sp_flutter_app/shared/widgets/simple_text_input_field.dart';
import 'package:sp_flutter_app/utils/helpers.dart';
import 'package:sp_flutter_app/viewmodels/user_profile_viewmodel.dart';
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
  final profanityFilter = ProfanityFilter();

  bool handleSubmit() {
    setState(() {
      preferredNameError = false;
      pwd1Error = false;
      pwd2Error = false;
    });
    // not a perfect profanity filter
    if (preferredName.isEmpty || profanityFilter.hasProfanity(preferredName)) {
      setState(() {
        preferredNameError = true;
      });
      return false;
    }
    if (password1 != password2 || !isPasswordCompliant(password1)) {
      setState(() {
        pwd1Error = true;
        pwd2Error = true;
      });
      return false;
    }
    return true;
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

  Widget _registerScreen(BuildContext context, UserViewModel _userViewModel,
      UserProfileViewModel _userProfileViewModel) {
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
                          text: ' ${_userViewModel.registrationEmail} ',
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
                        handleSubmit: ({success}) async {
                          if (handleSubmit()) {
                            // set the user profile preferred name
                            _userProfileViewModel.userProfile
                                .setPreferredName(preferredName);
                            // register user (This does NOT create profile.)
                            await _userViewModel.registerWithEmailAndPassword(
                                _userViewModel.registrationEmail, password1);
                            if (_userViewModel.viewModelResponse.state ==
                                ResponseState.ERROR) {
                              print("ERROR: There was an error registering.");
                            } else {
                              // Start setting data for the profile
                              // Again (This does NOT create the profile either.)
                              // When we actually call the method to add the user
                              // profile to the DB is when the profile is actually created
                              _userProfileViewModel.userProfile
                                  .setUid(_userViewModel.user.uid);
                              _userProfileViewModel.userProfile
                                  .setPreferredName(preferredName);
                              Navigator.of(context)
                                  .pushNamed(createProfileViewRoute);
                            }
                          }
                        },
                        svgAsset: "assets/svgs/envelop.svg",
                        text: "Register with Email",
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
    final _userProfileViewModel = Provider.of<UserProfileViewModel>(context);
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
        return _registerScreen(context, _userViewModel, _userProfileViewModel);
        break;
      case ResponseState.COMPLETE:
      default:
        return _registerScreen(context, _userViewModel, _userProfileViewModel);
        break;
    }
  }
}
