import 'package:TruthSeekers/utilities/index.dart';

class WelcomePage extends StatelessWidget {
  Widget getCases(String title, String cases, String inc, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
        Text(
          cases,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        (inc != null)
            ? Text(
                '[+$inc]',
                style: TextStyle(fontSize: 16, color: color),
              )
            : Text('')
      ],
    );
  }

  Widget getNews(BuildContext context, IconData icon, Color iconColor,
      String section, Map<int, Articles> articles) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                SizedBox(width: 10),
                Text(
                  section,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Provider.of<CurrentIndexProvider>(context, listen: false)
                    .setIndex(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationComplete(type: 'Trusted'),
                  ),
                );
              },
              child: Text(
                'View More',
                style: TextStyle(
                  color: Color(0xffA5A5A5),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticlePage(
                        icon: icon,
                        color: iconColor,
                        title: articles[index].title,
                        url: (articles[index].url == '' ||
                                articles[index].url == null)
                            ? "https://google.com"
                            : articles[index].url,
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
                  width: 170.0,
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
                          image: NetworkImage(articles[index].articleImage),
                          fit: BoxFit.cover,
                          height: 100,
                          width: 170,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                capitalize(articles[index]
                                    .source['name']
                                    .toString()
                                    .split('.')[0]),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffA5A5A5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    Map<int, Articles> articles =
        Provider.of<ArticlesProvider>(context, listen: false).getArtcle();

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
                      'Hello John!',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Hope you are safe, here is the latest news.',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5),
                    Icon(
                      Icons.info_outline,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Wordwide Cases',
                        //${widget.currentUser.email}`
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Updated: 20 mins ago',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCases(
                          'Confirmed',
                          '6.15M',
                          '116K',
                          Color(0xffFFA726),
                        ),
                        getCases(
                          'Recovered',
                          '2.64M',
                          null,
                          Color(0xff7CB342),
                        ),
                        getCases(
                          'Deaths',
                          '372K',
                          '5,017',
                          Color(0xffE53935),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            getNews(context, FontAwesomeIcons.checkCircle, Color(0xff7CB342),
                'Latest News', articles),
            getNews(context, Icons.warning, Color(0xffFB8C00), 'Fake News',
                articles),
          ],
        ),
      ),
    );
  }
}
