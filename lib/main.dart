import 'package:device_preview/device_preview.dart';
import 'package:TruthSeekers/utilities/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
}
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    FirebaseDatabase database = new FirebaseDatabase();
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);

    DatabaseReference _articleRef = database.reference().child('articles');
    DatabaseReference _sourcesRef = database.reference().child('sources');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticlesProvider>(
          create: (context) => ArticlesProvider(),
        ),
        ChangeNotifierProvider<SourcesProvider>(
          create: (context) => SourcesProvider(),
        ),
        ChangeNotifierProvider<CurrentIndexProvider>(
          create: (context) => CurrentIndexProvider(),
        )
      ],
      child: StreamBuilder(
          stream: _articleRef.onValue,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data.snapshot.value != null) {
              Map articlesData = snapshot.data.snapshot.value;
              final articles =
                  Provider.of<ArticlesProvider>(context, listen: false);
              int articlesCount = 0;
              articlesData.forEach(
                (index, data) {
                  articles.addArticle(articlesCount,
                      Articles.fromJson({"key": index, ...data}));
                  articlesCount++;
                },
              );
              return StreamBuilder(
                  stream: _sourcesRef.onValue,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      Map sourceData = snapshot.data.snapshot.value;
                      final sources =
                          Provider.of<SourcesProvider>(context, listen: false);
                      int sourcesCount = 0;
                      sourceData.forEach(
                        (index, data) {
                          sources.addSource(sourcesCount,
                              Sources.fromJson({"key": index, ...data}));
                          sourcesCount++;
                        },
                      );
                      return MaterialApp(
                        builder: DevicePreview.appBuilder,
                        theme: Provider.of<ThemeModel>(context).currentTheme,
                        initialRoute: Routes.navigation,
                        routes: Routes.routes,
                      );
                    } else {
                      return Container();
                    }
                  });
            } else {
              return MaterialApp(
                builder: DevicePreview.appBuilder,
                theme: Provider.of<ThemeModel>(context).currentTheme,
                home: Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
