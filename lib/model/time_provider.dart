import 'package:flutter/material.dart';

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

  bool isSeedExpired(String expiresAt) {
    return DateTime.now().isAfter(DateTime.parse(expiresAt)) ? true : false;
  }

//Takes in the string of the seed expiresAt property and checks the difference in seconds between now and the expiration date
//Saves that difference in _startTime
  getTimeToExpire(String expiresAt) {
    _startTime = DateTime.parse(expiresAt).difference(DateTime.now()).inSeconds;

    notifyListeners();
  }
}
