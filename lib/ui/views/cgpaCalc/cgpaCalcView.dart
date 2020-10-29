import 'package:flutter/material.dart';
import 'package:my_app/ui/views/cgpaCalc/cgpaCalcViewModel.dart';
import 'package:stacked/stacked.dart';

class CgpaCalcView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CgpaCalcViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          // backgroundColor: Colors.grey,
          // backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text('CGPA CALCULATOR'),
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
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: Column(
                              children: [
                                Text(
                                  'Enter appropriate GPA for the respective semesters',
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
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: model.isBusy
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount: model.semList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Center(
                                                child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Center(
                                                        child: Text(
                                                      model.semList[index],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .greenAccent),
                                                    ))),
                                              ),
                                              Container(
                                                color: Colors.greenAccent,
                                                height: 40,
                                                width: 100,
                                                child: model.textFields[index],
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
                                        Text('Congrats, your CGPA is'),
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
      viewModelBuilder: () => CgpaCalcViewModel(),
      disposeViewModel: true,
      onModelReady: (model) => model.initialize(),
    );
  }
}
