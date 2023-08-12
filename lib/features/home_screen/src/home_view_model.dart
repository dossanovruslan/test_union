import 'package:flutter/material.dart';

class HomScreenViewModel extends ChangeNotifier {
  int currentIndex = 1;

  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
