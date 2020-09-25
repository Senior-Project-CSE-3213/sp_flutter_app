import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/data/providers/network_provider.dart';
import 'package:sp_flutter_app/presentation/screens/authenticate/sign_in.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // ChangeNP/NetworkProvider NOT yet implemented fully
      create: (context) => NetworkProvider(),
      child: Container(
        child: SignIn(),
      ),
    );
  }
}
