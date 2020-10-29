import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/views/cgpa/cgpaViewModel.dart';
import 'package:stacked/stacked.dart';

class CgpaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CgpaViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Center(child: Text('CGPA')),
        ),
        body: model.isBusy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.0,
                          0.8), // 10% of the width, so there are ten blinds.
                      colors: [Colors.black, Colors.blueGrey], // red to yellow
                      // repeats the gradient over the canvas
                    ),
                  ),
                  margin: EdgeInsets.all(
                    5.0,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            Text(
                              'Choose Regulation',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.greenAccent),
                            ),
                            Center(
                              child: DropdownButton<String>(
                                value: model.dropdownRegulation,
                                icon: Icon(Icons.arrow_downward,
                                    color: Colors.greenAccent),
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
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.greenAccent),
                            ),
                            Center(
                              child: DropdownButton<String>(
                                value: model.dropdownDepartment,
                                icon: Icon(Icons.arrow_downward,
                                    color: Colors.greenAccent),
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
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.greenAccent),
                            ),
                            Center(
                              child: DropdownButton<String>(
                                value: model.dropdownSemester,
                                icon: Icon(Icons.arrow_downward,
                                    color: Colors.greenAccent),
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
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                        GestureDetector(
                          onTap: () {
                            model.navigationToCalc();
                          },
                          child: Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text('Next',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
      viewModelBuilder: () => CgpaViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }
}
