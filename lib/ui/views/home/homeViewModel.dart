import 'package:my_app/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  String _title = 'Home View';
  String get title => '$_title';
  int selectedIndex;
  void initialize() {
    selectedIndex = 0;
  }

  void onItemTapped(int index) {
    selectedIndex = index;
  }
}
