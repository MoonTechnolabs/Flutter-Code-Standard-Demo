import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NetworkConnectivity {
  final Connectivity _connectivity = Connectivity();

  Future<bool> checkInternet() async {
    try {
      var result = await _connectivity.checkConnectivity();
      return result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet;
    } on PlatformException catch (e) {
      debugPrint('Could not check connectivity status: $e');
      return false;
    }
  }
}
