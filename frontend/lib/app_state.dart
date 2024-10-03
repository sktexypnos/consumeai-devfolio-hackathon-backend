import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<dynamic> _userprofile = [];
  List<dynamic> get userprofile => _userprofile;
  set userprofile(List<dynamic> value) {
    _userprofile = value;
  }

  void addToUserprofile(dynamic value) {
    userprofile.add(value);
  }

  void removeFromUserprofile(dynamic value) {
    userprofile.remove(value);
  }

  void removeAtIndexFromUserprofile(int index) {
    userprofile.removeAt(index);
  }

  void updateUserprofileAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    userprofile[index] = updateFn(_userprofile[index]);
  }

  void insertAtIndexInUserprofile(int index, dynamic value) {
    userprofile.insert(index, value);
  }
}
