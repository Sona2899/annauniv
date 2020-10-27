import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/views/home/homeViewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Anna Univ calculator'),
        ),
        body: Center(
          child: Text('hello'),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }
}
