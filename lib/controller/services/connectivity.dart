import 'package:connectivity/connectivity.dart';

Future<bool> connected() async {
  var result = await Connectivity().checkConnectivity();
  switch (result) {
    case ConnectivityResult.mobile:
      {
        return true;
      }
    case ConnectivityResult.wifi:
      {
        return true;
      }
    case ConnectivityResult.none:
      {
        return false;
      }
  }
}
