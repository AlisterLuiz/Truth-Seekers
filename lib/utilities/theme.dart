import 'package:TruthSeekers/utilities/index.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: Color(0xffA5A5A5),
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(elevation: 0.0),
  backgroundColor: Color(0xff000000),
  cardColor: Color(0xff131313),
  primaryColor: Colors.white,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  accentColor: Color(0xffA5A5A5),
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(
    elevation: 0,
  ),
  backgroundColor: Color(0xffFFFFFF),
  cardColor: Colors.white,
  primaryColor: Colors.black,
);
