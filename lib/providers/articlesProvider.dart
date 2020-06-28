import 'package:TruthSeekers/utilities/index.dart';

class ArticlesProvider extends ChangeNotifier {
  final Map<int, Articles> _articles = {};

  addArticle(int index, Articles article) {
    _articles[index] = article;
    notifyListeners();
  }

  Map<int, Articles> getArtcle() => _articles;
}
