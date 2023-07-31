import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final String _title = "Home view";
  String get title => '$_title $_counter';
  int _counter = 0;
  int get counter => _counter;
  void updateCounter(){
    _counter++;
    //notify listeners (usually UI components) that the state of the view model 
    //has changed and the UI needs to be updated to reflect those changes.
    notifyListeners();
  }
}
