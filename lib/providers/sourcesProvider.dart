import 'package:TruthSeekers/utilities/index.dart';

class SourcesProvider extends ChangeNotifier {
  final Map<int, Sources> _sources = {};

  addSource(int index, Sources source) {
    _sources[index] = source;
    notifyListeners();
  }

  Map<int, Sources> getSource() => _sources;
}
