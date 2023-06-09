import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int countdown = 1144;

  updateTimer() {
    countdown--;
    notifyListeners();
  }
}
