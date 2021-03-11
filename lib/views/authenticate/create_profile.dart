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

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  // Text field state
  String firstName = '';
  String lastName = '';
  String username = '';
  bool usernameError = false;
  bool firstNameError = false;
  bool lastNameError = false;
  final profanityFilter = ProfanityFilter();

  bool handleSubmit() {
    setState(() {
      usernameError = false;
      firstNameError = false;
      lastNameError = false;
    });
    // not a perfect profanity filter
    // TODO: Add a check to see if username is taken or not
    if (username.isEmpty || profanityFilter.hasProfanity(username)) {
      setState(() {
        usernameError = true;
      });
      return false;
    }
    if (firstName.isEmpty || profanityFilter.hasProfanity(firstName)) {
      setState(() {
        firstNameError = true;
        lastNameError = true;
      });
      return false;
    }
    return true;
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
                HeadingText(text: "Create Profile"),
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
                          text: ' ${_userViewModel.user.email} ',
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
                      SimpleInputLabel(text: "Username"),
                      SimpleTextInputField(
                        error: usernameError,
                        handleSubmit: handleSubmit,
                        handleChange: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                      ),
                      SimpleInputLabel(text: "First Name"),
                      SimpleTextInputField(
                        error: firstNameError,
                        handleSubmit: handleSubmit,
                        handleChange: (val) {
                          setState(() {
                            firstName = val;
                          });
                        },
                      ),
                      SimpleInputLabel(text: "Last Name"),
                      SimpleTextInputField(
                        error: lastNameError,
                        handleSubmit: handleSubmit,
                        handleChange: (val) {
                          setState(() {
                            lastName = val;
                          });
                        },
                      ),
                      SizedBox(height: kDefaultPadding * 2.0),
                      FullWidthTextButtonWithIcon(
                        handleSubmit: ({success}) async {
                          if (handleSubmit()) {
                            // set the user profile data
                            _userProfileViewModel.userProfile
                                .setUid(_userViewModel.user.uid);
                            _userProfileViewModel.userProfile
                                .setUsername(username);
                            _userProfileViewModel.userProfile
                                .setFirstName(firstName);
                            _userProfileViewModel.userProfile
                                .setLastName(lastName);
                            // register user profile in database
                            await _userProfileViewModel.registerUserProfile();
                            if (_userViewModel.viewModelResponse.state ==
                                ResponseState.ERROR) {
                              print(
                                  "ERROR: There was an error registering user profile.");
                            } else {
                              _userViewModel.profileCreated = true;
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  mapViewRoute, (route) => false);
                            }
                          }
                        },
                        svgAsset: "assets/svgs/checkmark.svg",
                        svgColor: Colors.green,
                        text: "Finish Registration",
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
