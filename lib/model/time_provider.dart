import 'package:flutter/material.dart';
import 'package:qr_code_test/model/qr_provider.dart';
import 'package:provider/provider.dart';

class TimerProvider extends ChangeNotifier {
  //_starttime holds the value of seconds to expiration of the seed
  int _startTime = 0;

//exposes _start time to external classes
  get timeLeft => _startTime;

//Decrements _starttime by 1
  subtractTimer() {
    _startTime--;
    notifyListeners();
  }

  bool isSeedExpired(BuildContext context) {
    return DateTime.now().isAfter(
            DateTime.parse(context.read<QrProvider>().seedValue.expiresAt))
        ? true
        : false;
  }

//Takes in the string of the seed expiresAt property and checks the difference in seconds between now and the expiration date
//Saves that difference in _startTime
  getTimeToExpire(BuildContext context) {
    _startTime = DateTime.parse(context.read<QrProvider>().seedValue.expiresAt)
        .difference(DateTime.now())
        .inSeconds;

    notifyListeners();
  }
}
