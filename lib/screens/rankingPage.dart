import 'package:TruthSeekers/utilities/index.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  Map<int, bool> expanded = {};

  Color getColor(int index) {
    if (index < 4)
      return Colors.green;
    else if (index >= 4 && index < 7)
      return Colors.orange;
    else
      return Colors.red;
  }

  String getRating(int index) {
    if (index < 4)
      return '98';
    else if (index >= 4 && index < 7)
      return '73';
    else
      return '45';
  }

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  onListExpansionChanged(bool expanded) {
    //returns if it was expanded (true) or collapsed (false)
    if (expanded) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  Widget build(BuildContext context) {
    Map<int, Sources> sources =
        Provider.of<SourcesProvider>(context, listen: false).getSource();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trusted Sources',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'News sources you can trust, click to know more.',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                dividerTheme: DividerThemeData(
                    color: Theme.of(context).colorScheme.background),
              ),
              child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExpansionTile(
                          onExpansionChanged: (expand) {
                            setState(() {
                              expanded[i] = expand;
                              print(expanded);
                            });
                          },
                          title: (expanded[i] == false || expanded[i] == null)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text((i + 1).toString()),
                                    SizedBox(width: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(
                                          sources[i].logo,
                                          height: 70,
                                          width: 70,
                                        ),
                                        Container(
                                          width: 110,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                capitalize(sources[i]
                                                    .name
                                                    .toString()
                                                    .split('.')[0].toUpperCase()),
                                                maxLines: 3,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                getRating(i),
                                                style: TextStyle(
                                                  color: getColor(i),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text((i + 1).toString()),
                                    Image.network(
                                      sources[i].logo,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ],
                                ),
                          trailing: (expanded[i] == false ||
                                  expanded[i] == null)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesomeIcons.caretDown),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesomeIcons.caretDown),
                                  ],
                                ),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Text(
                                          capitalize(sources[i]
                                              .name
                                              .toString()
                                              .split('.')[0].toUpperCase()),
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            getRating(i),
                                            style: TextStyle(
                                              color: getColor(i),
                                              fontSize: 30,
                                            ),
                                          ),
                                          Text(
                                            'User Rating',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "The Indian Express is a daily English language newspaper published from Delhi, India. It was first launched in 1978, and is currently distributed throughout the India. Its online edition was launched in 1996.",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      maxLines: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
