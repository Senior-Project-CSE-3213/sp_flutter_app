import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/gradient_background.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import '../../shared/response.dart';
import '../../viewmodels/user_viewmodel.dart';

class SignInEmail extends StatefulWidget {
  @override
  _SignInEmailState createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  // Text field state
  String email = '';
  bool error = false;

  void handleSubmit() {
    if (!error && EmailValidator.validate(email)) {
      // set view model data
      // navigate
      Navigator.of(context).pushNamed(registerViewRoute);
    }
    // otherwise maybe shake the input button?
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: Container(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding * 2.0),
              child: SvgPicture.asset(
                "assets/svgs/arrow-left2.svg",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GradientBackground(),
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
                Text(
                  "What's your email address?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: kDefaultPadding * 2.0,
                          bottom: kDefaultPadding,
                        ),
                        child: Text(
                          "YOUR EMAIL",
                          style: TextStyle(
                            color: Color(0xffadadb2),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ),
                      TextField(
                        autofocus: true,
                        onSubmitted: (_) => handleSubmit(),
                        onChanged: handleEmailChange,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: error ? Colors.red : kSecondaryColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: error ? Colors.red : kSecondaryColor,
                              width: 2,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: error ? Colors.red : kSecondaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding * 2.0),
                      FullWidthButtonWithIcon(submit: handleSubmit),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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

class FullWidthButtonWithIcon extends StatelessWidget {
  const FullWidthButtonWithIcon({
    Key key,
    @required this.submit,
  }) : super(key: key);

  final void Function() submit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: FlatButton(
        onPressed: submit,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        color: const Color(0xff246bfd),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/envelop.svg",
                height: 24,
              ),
              SizedBox(width: 16),
              Text(
                'Continue with Email',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
