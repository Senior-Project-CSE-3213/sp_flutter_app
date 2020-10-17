import 'package:flutter/foundation.dart';

// TODO: This still needs more work done

class NetworkProvider with ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  String errorMsg = "";

  set setLoading(val) => isLoading = val;

  bool get loading => isLoading;

  void setError(bool val, String msg) {
    hasError = val;
    errorMsg = msg;
    notifyListeners();
  }

  bool get error => hasError;

  String get errorMessage => errorMsg;
}
