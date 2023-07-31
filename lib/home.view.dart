import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  //provides information about the widgets position
  Widget build(BuildContext context) { 
    //separate the UI components from the underlying state management logic(rebild the ui whnevr the state changes)
    return ViewModelBuilder<HomeViewModel>.
    reactive(// UI is automatically rebuilt
      viewModelBuilder: () {
        return HomeViewModel();
      },
      //it is a callback function ,in widgets that are designed to react to changes in data and rebuild their UI accordingly
      //contex:argumet, that provide information about the widget's position in the widget tree, to access various resources, such as theme data, media queries, and navigation.
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Text(viewModel.title),
          ),
          floatingActionButton:
              FloatingActionButton(onPressed:viewModel.updateCounter)
        );
      },
    );
  }
}

