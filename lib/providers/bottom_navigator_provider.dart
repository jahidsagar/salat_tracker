import 'package:flutter/foundation.dart';

class BottomNavigatorProvider extends ChangeNotifier{
  int _selected = 0;

  int get selected => _selected;

  void  setSelected(int value) {
    _selected = value;
    notifyListeners();
  }
}