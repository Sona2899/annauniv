import 'package:injectable/injectable.dart';

@lazySingleton
class UserSelection {
  String _selectedRegulation;
  String _selectedDepartment;
  String _selectedSemester;
  get selectedRegulation => _selectedRegulation;
  get selectedDepartment => _selectedDepartment;
  get selectedSemester => _selectedSemester;
  set cgpaRegulationSelection(String regulation) {
    _selectedRegulation = regulation;
  }

  set cgpaDepartmentSelection(String department) {
    _selectedDepartment = department;
  }

  set cgpaSemesterSelection(String semester) {
    _selectedSemester = semester;
  }
}
