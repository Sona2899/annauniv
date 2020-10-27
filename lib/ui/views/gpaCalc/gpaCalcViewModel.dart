import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/services/userSelectionService.dart';
// import 'package:my_app/app/locator.dart';
// import 'package:my_app/app/router.gr.dart';
// import 'package:my_app/services/userSelectionService.dart';
import 'package:stacked/stacked.dart';
//import 'package:stacked_services/stacked_services.dart';

class GpaCalcViewModel extends BaseViewModel {
  final UserSelection _userSelectionService = locator<UserSelection>();
  // final NavigationService _navigationService = locator<NavigationService>();
  final firestoreInstance = FirebaseFirestore.instance;
  List<String> dropdowndefault = ['S', 'S', 'S', 'S', 'S'];

  String _title = 'Home View';
  String get title => '$_title';

  List<String> _sub = [];
  List<String> get sub => _sub;
  List<int> _credits = [];
  List<int> get credits => _credits;
  String dropdownValue;

  Future _onPressed() async {
    await firestoreInstance
        .collection("cgpa")
        .doc('Ix5zgzjsBeMsskGv0vEz')
        .get()
        .then((value) {
      _sub = List.from(value.data()[_userSelectionService.selectedRegulation]
              [_userSelectionService.selectedDepartment]
          [_userSelectionService.selectedSemester]);
      _credits = List.from(
          value.data()[_userSelectionService.selectedRegulation]
                  [_userSelectionService.selectedDepartment]
              ['credits-' + _userSelectionService.selectedSemester[9]]);
      print(credits);
    });
    notifyListeners();
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
      if (element == 'S') {
        valueForGrade.add(10);
      } else if (element == 'A') {
        valueForGrade.add(9);
      } else if (element == 'B') {
        valueForGrade.add(8);
      } else if (element == 'C') {
        valueForGrade.add(7);
      } else if (element == 'D') {
        valueForGrade.add(6);
      } else if (element == 'E') {
        valueForGrade.add(5);
      } else {
        valueForGrade.add(0);
      }
      creditTotal = creditTotal + credits[i];
      s = s + (valueForGrade[i] * credits[i]);
      i = i + 1;
      print(i);
    });
    _ans = s / creditTotal;
    notifyListeners();
  }

  void initialize() {
    _onPressed();
  }
}
