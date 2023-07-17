import 'dart:async';

import 'package:core/core.dart';


class NetworkInfo {
  
  NetworkInfo();

  static Future<bool> checkInternetConnection() async {
    final ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile
        ? true
        : false;
  }
}
