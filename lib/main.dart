import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/views/authenticate/using_email.dart';
import 'package:sp_flutter_app/views/authenticate/register.dart';
import 'package:sp_flutter_app/views/authenticate/sign_in.dart';
import 'views/map/map.dart';
import 'views/help/help.dart';
import 'views/profile/profile.dart';
import 'views/settings/settings.dart';
import 'views/wrapper.dart';
import 'shared/constants.dart';
import 'viewmodels/user_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(initialRoute: mapViewRoute, routes: {
        usingEmailViewRoute: (_) => UsingEmail(),
        registerViewRoute: (_) => Register(),
        signInViewRoute: (_) => SignIn(),
        mapViewRoute: (_) => Wrapper(child: MapView()),
        profileViewRoute: (_) => ProfileScreen(),
        helpViewRoute: (_) => HelpScreen(),
        settingViewRoute: (_) => SettingScreen(),
      }),
    );
  }
}
