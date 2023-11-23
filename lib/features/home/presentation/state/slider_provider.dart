import 'package:flutter/widgets.dart';

class SliderProvider with ChangeNotifier {
  SliderProvider() {
    _transitionalValue = _defaultValue.toDouble();
    _finalValue = _defaultValue;
  }

  final int _defaultValue = 53;

  double? _transitionalValue;
  double? get transitionalValue => _transitionalValue;

  int? _finalValue;
  int? get finalValue => _finalValue;

  set transitionalValue(double? value) {
    _transitionalValue = value;
    notifyListeners();
  }

  set finalValue(int? value) {
    _finalValue = value;
    notifyListeners();
  }

  updateTrasitionalValue(double newValue) {
    _transitionalValue = newValue;
    notifyListeners();
  }

  updateFinalValue() {
    _finalValue = _transitionalValue!.round();
    notifyListeners();
  }
}
