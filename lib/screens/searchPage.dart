import 'package:TruthSeekers/utilities/index.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String filter = '';

  Widget build(BuildContext context) {
    Map<int, Articles> articles =
        Provider.of<ArticlesProvider>(context, listen: false).getArtcle();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Search for news articles.',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.checkCircle,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Trusted Source',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Untrusted Source',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 400,
                  height: 50,
                  child: TextField(
                      onChanged: (value) {
                        setState(() {
                          filter = value;
                        });
                      },
                      textAlign: TextAlign.left,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Montserrat',
                        ),
                        labelText: "Search",
                        fillColor: Theme.of(context).primaryColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.68,
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return (articles[index]
                        .title
                        .toString()
                        .toLowerCase()
                        .contains(filter.toLowerCase()))
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticlePage(
                                icon: Icons.check_circle,
                                color: Color(0xff7CB342),
                                url: (articles[index].url == '' ||
                                        articles[index].url == null)
                                    ? "https://google.com"
                                    : articles[index].url,
                                title: articles[index].title,
                                source: articles[index].source['name'],
                                date: articles[index].publishedAt,
                                image: articles[index].articleImage,
                                desc: articles[index].content,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.34,
                          child: Card(
                            color: Theme.of(context).cardColor,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      articles[index].articleImage),
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * 0.19,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        articles[index].title,
                                        style: TextStyle(fontSize: 13),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        maxLines: 3,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.checkCircle,
                                                color: Colors.green,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                articles[index].source['name'],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xffA5A5A5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                articles[index]
                                                    .rating
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
