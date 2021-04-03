import 'package:flutter/material.dart';

enum CoffesState { normal, animated }

class CoffesNotifier with ChangeNotifier {

  CoffesState coffesState = CoffesState.normal;

  void changeToNormal() {
    coffesState = CoffesState.normal;
    notifyListeners();
  }

  void changeToAnimated() {
    coffesState = CoffesState.animated;
    notifyListeners();
  }

}