import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionProvider extends ChangeNotifier {
  bool _isDeviceConnected = false;
  ConnectionProvider() {
    // var subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
    //   if(result != ConnectivityResult.none) {
    //     _isDeviceConnected = await InternetConnectionChecker().hasConnection;
    //     notifyListeners();
    //   }
    // });
    var listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected: {
          if(_isDeviceConnected) {
            break;
          }
          _isDeviceConnected=true;
          notifyListeners();
          break;
        }
        case InternetConnectionStatus.disconnected: {
          if(!_isDeviceConnected) {
            break;
          }
          _isDeviceConnected=false;
          notifyListeners();
          break;
        }
      }
    });
  }
  bool get isConnectedToNetwork => _isDeviceConnected;
}