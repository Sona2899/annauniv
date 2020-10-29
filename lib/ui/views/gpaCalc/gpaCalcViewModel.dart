import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/services/userSelectionService.dart';
import 'package:stacked/stacked.dart';

class GpaCalcViewModel extends BaseViewModel {
  final result = new GlobalKey();
  final UserSelection _userSelectionService = locator<UserSelection>();
  final firestoreInstance = FirebaseFirestore.instance;
  List<String> dropdowndefault = [];

  bool isBusy = false;
  String _title = 'Home View';
  String get title => '$_title';
  List<String> _sub = [];
  List<String> get sub => _sub;
  List<String> _gradeList = [];
  List<String> get gradeList => _gradeList;
  List<int> _credits = [];
  List<int> get credits => _credits;
  String _highGrade;
  String get highGrade => _highGrade;
  String dropdownValue;
  var cgpaDocumentSelectedReg;
  var map2;
  var t1;
  Future _onPressed() async {
    isBusy = true;
    notifyListeners();
    await firestoreInstance
        .collection("cgpa")
        .doc('Ix5zgzjsBeMsskGv0vEz')
        .get()
        .then((value) {
      cgpaDocumentSelectedReg =
          Map.from(value.data()[_userSelectionService.selectedRegulation]);
    });
    print('hello');
    map2 = Map.from(cgpaDocumentSelectedReg['Grade']);

    _sub = List.from(
        cgpaDocumentSelectedReg[_userSelectionService.selectedDepartment]
            [_userSelectionService.selectedSemester]);
    _credits = List.from(
        cgpaDocumentSelectedReg[_userSelectionService.selectedDepartment]
            ['credits-' + _userSelectionService.selectedSemester[9]]);
    _gradeList = (List.from(cgpaDocumentSelectedReg['Grade'].keys));
    print(map2);
    _highGrade = cgpaDocumentSelectedReg['Grade']
        .keys
        .firstWhere((k) => cgpaDocumentSelectedReg['Grade'][k] == 10);
    for (var i = 0; i < sub.length; i = i + 1) dropdowndefault.add(highGrade);

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
    List<int> valueForGrade = List<int>();
    double s = 0;
    double creditTotal = 0;
    var i = 0;
    dropdowndefault.forEach((element) {
      map2.forEach((k, v) => {
            if (k == element) valueForGrade.add(v),
          });
      creditTotal = creditTotal + credits[i];
      s = s + (valueForGrade[i] * credits[i]);
      i = i + 1;
    });
    //
    // for (var i = 0; i < valueForGrade.length; i = i + 1) {
    //   if (valueForGrade[i] != 0) {
    //     creditTotal = creditTotal + credits[i];
    //     s = s + (valueForGrade[i] * credits[i]);
    //
    //     print(credits[i]);
    //   }
    // }

    // if (_userSelectionService.selectedRegulation == 'Regulation-2013')
    //   dropdowndefault.forEach((element) {
    //     if (element == 'S') {
    //       valueForGrade.add(10);
    //     } else if (element == 'A') {
    //       valueForGrade.add(9);
    //     } else if (element == 'B') {
    //       valueForGrade.add(8);
    //     } else if (element == 'C') {
    //       valueForGrade.add(7);
    //     } else if (element == 'D') {
    //       valueForGrade.add(6);
    //     } else if (element == 'E') {
    //       valueForGrade.add(5);
    //     } else {
    //       valueForGrade.add(0);
    //     }
    //     if (element != 'U') {
    //       creditTotal = creditTotal + credits[i];
    //       s = s + (valueForGrade[i] * credits[i]);
    //     }
    //     i = i + 1;
    //   });
    // if (_userSelectionService.selectedRegulation == 'Regulation-2017')
    //   dropdowndefault.forEach((element) {
    //     if (element == 'O') {
    //       valueForGrade.add(10);
    //     } else if (element == 'A+') {
    //       valueForGrade.add(9);
    //     } else if (element == 'A') {
    //       valueForGrade.add(8);
    //     } else if (element == 'B+') {
    //       valueForGrade.add(7);
    //     } else if (element == 'B') {
    //       valueForGrade.add(6);
    //     } else {
    //       valueForGrade.add(0);
    //     }
    //     // if (element != 'RA') {
    //     creditTotal = creditTotal + credits[i];
    //     s = s + (valueForGrade[i] * credits[i]);
    //     //  }
    //     i = i + 1;
    //   });
    _ans = s / creditTotal;
    _ans = double.parse((_ans).toStringAsFixed(3));
    notifyListeners();
  }

  void initialize() {
    isBusy = true;
    _onPressed();
    isBusy = false;
  }
}
