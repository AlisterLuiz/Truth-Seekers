import 'package:TruthSeekers/utilities/index.dart';

class CurrentIndexProvider extends ChangeNotifier {
  int _currentIndex = 0;

  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}
