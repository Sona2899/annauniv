import 'package:flutter/material.dart';
import 'package:my_app/ui/views/gpaCalc/gpaCalcViewModel.dart';
import 'package:stacked/stacked.dart';

class GpaClacView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GpaCalcViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          // backgroundColor: Colors.grey,
          // backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text('GPA CALCULATOR'),
          ),
          body: SafeArea(
            child: model.isBusy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.0,
                              0.8), // 10% of the width, so there are ten blinds.
                          colors: [
                            Colors.black,
                            Colors.blueGrey
                          ], // red to yellow
                          // repeats the gradient over the canvas
                        ),
                      ),
                      margin: EdgeInsets.all(
                        5.0,
                      ),
                      //padding: EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: Column(
                              children: [
                                Text(
                                  'Enter appropriate grades for the respective subjects',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent,
                                      fontSize: 20),
                                ),
                                Text(
                                  'All The Best',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellowAccent,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.56,
                            child: model.isBusy
                                ? Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.red,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: model.sub.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Center(
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      model.sub[index],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .greenAccent),
                                                    )),
                                              ),
                                              DropdownButton<String>(
                                                value: model
                                                    .dropdowndefault[index],
                                                icon: Icon(
                                                  Icons.arrow_downward,
                                                  color: Colors.greenAccent,
                                                ),
                                                iconSize: 20,
                                                elevation: 0,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                                onChanged: (String newValue) {
                                                  model.onChangeOption(
                                                      newValue, index);
                                                },
                                                items: model.gradeList.map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                          String>(
                                                      value: value,
                                                      child: Container(
                                                        width: 50,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .greenAccent,
                                                        ),
                                                        child: Center(
                                                            child: Text(value)),
                                                      ));
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 2,
                                            height: 20,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                          ),
                          Container(
                            //height: MediaQuery.of(context).size.height * 0.2659,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    model.onChangeGpa();
                                    Scrollable.ensureVisible(
                                        model.result.currentContext);
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      'Calculate',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  key: model.result,
                                ),
                                if (model.ans != -1)
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 100,
                                    width: 170,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text('Congrats, your gpa is\n'),
                                        Text(
                                          model.ans.toString(),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
      viewModelBuilder: () => GpaCalcViewModel(),
      disposeViewModel: true,
      onModelReady: (model) => model.initialize(),
    );
  }
}
