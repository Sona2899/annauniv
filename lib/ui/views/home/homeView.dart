import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/ui/views/home/homeViewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Anna Univ calculator')),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? MediaQuery.of(context).size.height * 0.8288
                : MediaQuery.of(context).size.height * 2.5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.0, 0.8), // 10% of the width, so there are ten blinds.
                  colors: [Colors.black, Colors.blueGrey], // red to yellow
                  // repeats the gradient over the canvas
                ),
              ),
              margin: EdgeInsets.all(
                5.0,
              ),
              child: Column(
                children: [
                  Lottie.network(
                      'https://assets7.lottiefiles.com/private_files/lf30_TBKozE.json'),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_phzkCc/03 - Back.json',
                            height: 100,
                            width: 100),
                        Lottie.network(
                            'https://assets3.lottiefiles.com/private_files/lf30_1TcivY.json',
                            height: 100,
                            width: 100),
                        Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_O3WEx3/02 - Forward.json',
                            height: 100,
                            width: 100),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }
}
