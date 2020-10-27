import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/views/gpa/gpaViewModel.dart';
import 'package:stacked/stacked.dart';

class GpaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GpaViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Center(child: Text('GPA')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Choose Regulation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Center(
                    child: DropdownButton<String>(
                      value: model.dropdownRegulation,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      onChanged: (String newValue) {
                        model.onChangeRegulation(newValue);
                      },
                      items: model.regulation
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent,
                              ),
                              width: 300,
                              height: 40,
                              child: Center(child: Text(value)),
                            ));
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Choose Department',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Center(
                    child: DropdownButton<String>(
                      value: model.dropdownDepartment,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      onChanged: (String newValue) {
                        model.onChangeDepartment(newValue);
                      },
                      items: model.department
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent,
                              ),
                              width: 300,
                              height: 40,
                              child: Center(child: Text(value))),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Choose Semester',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Center(
                    child: DropdownButton<String>(
                      value: model.dropdownSemester,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      onChanged: (String newValue) {
                        model.onChangeSemester(newValue);
                      },
                      items: model.semester
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent,
                              ),
                              width: 300,
                              height: 40,
                              child: Center(child: Text(value))),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                    onTap: () {
                      model.navigationToCalc();
                    },
                    child: Center(
                        child: Text('Next',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)))),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => GpaViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }
}
