import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/services/userSelectionService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CgpaCalcViewModel extends BaseViewModel {
  final UserSelection _userSelectionService = locator<UserSelection>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final firestoreInstance = FirebaseFirestore.instance;

  List<String> dropdowndefault = ['S', 'S', 'S', 'S', 'S'];
  bool isBusy = false;
  String _title = 'Home View';
  String get title => '$_title';
  List<String> _sub = [];
  List<String> get sub => _sub;
  List<int> _credits = [];
  List<int> get credits => _credits;
  String dropdownValue;
  double sem;
  List<String> _semList = [];
  List<String> get semList => _semList;
  var textEditingControllers = <TextEditingController>[];
  var textFields = <TextField>[];
  _onPressed() {
    isBusy = true;

    sem = double.parse(_userSelectionService.selectedSemester[9]);
    for (var i = 1; i <= sem; i = i + 1) {
      _semList.add('semester-' + i.toString());
    }

    semList.forEach((str) {
      var textEditingController = new TextEditingController();
      textEditingControllers.add(textEditingController);
      return textFields.add(new TextField(controller: textEditingController));
    });

    notifyListeners();
    isBusy = false;
  }

  onChangeOption(String newValue, int index) {
    dropdowndefault[index] = newValue;
    notifyListeners();
  }

  double _ans = -1;
  double get ans => _ans;
  Future onChangeGpa() async {
    double s = 0;

    for (var element in textEditingControllers) {
      if (double.parse(element.text) > 10 ||
          double.parse(element.text) < 0 ||
          element.text.isEmpty) {
        _ans = -1;
        _snackbarService.showSnackbar(
          message: 'Enter the valid number',
          title: 'Please!!!',
          duration: Duration(seconds: 2),
          onTap: (_) {
            print('snackbar tapped');
          },
          mainButtonTitle: 'Undo',
          onMainButtonTapped: () => print('Undo the action!'),
        );
        break;
      }
      s = s + double.parse(element.text);
    }
    _ans = double.parse((s / sem).toStringAsFixed(3));

    notifyListeners();
  }

  void initialize() {
    isBusy = true;
    _onPressed();
    isBusy = false;
  }
}
