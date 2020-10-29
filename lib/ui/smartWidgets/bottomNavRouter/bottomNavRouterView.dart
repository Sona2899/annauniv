import 'package:flutter/material.dart';
import 'package:my_app/ui/views/cgpa/cgpaView.dart';
import 'package:my_app/ui/views/gpa/gpaView.dart';
import 'package:stacked/stacked.dart';

import '../../views//home/homeView.dart';
import 'bottomNavRouterViewModel.dart';

class BottomNavRouterView extends StatelessWidget {
  const BottomNavRouterView({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavRouterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: Container(
                child: Icon(
                  Icons.home_outlined,
                ),
              ),
              label: 'HOME',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'GPA',
              icon: Icon(
                Icons.calculate,
              ),
            ),
            BottomNavigationBarItem(
              label: 'CGPA',
              icon: Icon(
                Icons.calculate_outlined,
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => BottomNavRouterViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return GpaView();
      default:
        return CgpaView();
    }
  }
}
