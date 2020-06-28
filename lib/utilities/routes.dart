import 'package:TruthSeekers/utilities/index.dart';

class Routes {
  Routes._();

  //static variables
  static const String navigation = '/navigation';
  static const String welcome = '/welcome';
  static const String search = '/search';
  static const String ranking = '/ranking';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    navigation: (BuildContext context) => NavigationBar(),
    welcome: (BuildContext context) => WelcomePage(),
    search: (BuildContext context) => SearchPage(),
    ranking: (BuildContext context) => RankingPage(),
    profile: (BuildContext context) => ProfilePage(),
  };
}
