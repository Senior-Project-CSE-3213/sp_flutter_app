import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/gradient_background.dart';
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
              print("tapped");
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
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text("test"),
                  ],
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
