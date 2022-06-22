import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkMode extends ChangeNotifier {
  bool _isDark = false;
  int count = 0;
  int get counter => count;
  void increment() {
    count++;
    notifyListeners();
  }

  bool get darkMode => _isDark;
  void setDark() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
