import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/app/router.gr.dart';
import 'package:my_app/services/userSelectionService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GpaViewModel extends BaseViewModel {
  final UserSelection _userSelectionService = locator<UserSelection>();
  final NavigationService _navigationService = locator<NavigationService>();
  final firestoreInstance = FirebaseFirestore.instance;
  String dropdownRegulation = 'Regulation-2013';
  String dropdownDepartment = 'IT';
  String dropdownSemester = 'semester-1';
  String _title = 'Home View';
  String get title => '$_title';
  bool isBusy;

  int selectedIndex;

  List<String> _regulation = [];
  List<String> get regulation => _regulation;
  List<String> _department = [];
  List<String> get department => _department;
  List<String> _semester = [];
  List<String> get semester => _semester;

  Future _onPressed() async {
    isBusy = true;
    await firestoreInstance
        .collection("cgpa")
        .doc('Wj3DWsiuLNGhEO3BQO7I')
        .get()
        .then((value) {
      _regulation = List.from(value.data()['regulation']);
      _department = List.from(value.data()['department']);
      _semester = List.from(value.data()['semester']);
    });
    notifyListeners();
    isBusy = false;
  }

  void initialize() {
    selectedIndex = 0;
    _onPressed();
  }

  void onChangeRegulation(String newValue) {
    dropdownRegulation = newValue;
    notifyListeners();
  }

  void onChangeDepartment(String newValue) {
    dropdownDepartment = newValue;
    notifyListeners();
  }

  void onChangeSemester(String newValue) {
    dropdownSemester = newValue;
    notifyListeners();
  }

  void navigationToCalc() async {
    _userSelectionService.cgpaRegulationSelection = dropdownRegulation;
    _userSelectionService.cgpaDepartmentSelection = dropdownDepartment;
    _userSelectionService.cgpaSemesterSelection = dropdownSemester;
    await _navigationService.navigateTo(Routes.gpaCalcViewRoute);
  }
}
