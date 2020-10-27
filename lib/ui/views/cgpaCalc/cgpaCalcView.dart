import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/views/cgpaCalc/cgpaCalcViewModel.dart';
import 'package:stacked/stacked.dart';

class CgpaCalcView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CgpaCalcViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Anna Univ calculator'),
          ),
          body: Container()),
      viewModelBuilder: () => CgpaCalcViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }
}
