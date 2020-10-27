import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/services/userSelectionService.dart';
import 'package:stacked/stacked.dart';
//import 'package:stacked_services/stacked_services.dart';

class CgpaCalcViewModel extends BaseViewModel {
  final firestoreInstance = FirebaseFirestore.instance;
  //final NavigationService _navigationService = locator<NavigationService>();
  String _title = 'Home View';
  String get title => '$_title';
  int selectedIndex;
  final UserSelection _userSelectionService = locator<UserSelection>();
  Future _onPressed() async {
    await firestoreInstance
        .collection("cgpa")
        .doc('Ix5zgzjsBeMsskGv0vEz')
        .get()
        .then((value) {
      var v = value.data()[_userSelectionService.selectedRegulation]
              [_userSelectionService.selectedDepartment]
          [_userSelectionService.selectedSemester];
      print(v);
    });
    notifyListeners();
  }

  void initialize() {
    selectedIndex = 0;
    // print(_userSelectionService.selectedDepartment);
    _onPressed();
    // print(_userSelectionService.selectedRegulation);
    // print(_userSelectionService.selectedSemester);
  }

  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
