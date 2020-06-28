import 'package:TruthSeekers/utilities/index.dart';

class ArticlePage extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String url;
  final String source;
  final String date;
  final String image;
  final String desc;

  ArticlePage(
      {@required this.icon,
      @required this.color,
      @required this.title,
      @required this.url,
      @required this.source,
      @required this.date,
      @required this.image,
      @required this.desc});

  Widget getReview(
      BuildContext context, IconData icon, Color color, String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: RaisedButton(
        textColor: Theme.of(context).primaryColor,
        color: color,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget build(BuildContext context) {
    List dateFormatted = [
      DateTime.parse(date).hour.toString(),
      DateTime.parse(date).day.toString(),
      kMonthsInYear[DateTime.parse(date).month.toInt()],
      DateTime.parse(date).year.toString()
    ];
    String urlParse = '';
    if (url.contains('https'))
      urlParse = url;
    else
      urlParse = url.replaceFirst('http', "https");

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 15.0),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    icon,
                    color: color,
                  ),
                  SizedBox(width: 10),
                  Text(
                    (color == Color(0xff7CB342))
                        ? 'Verified News Source'
                        : 'Unverified News Source',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              maxLines: null,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                source,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffA5A5A5),
                ),
              ),
              Text(
                '${dateFormatted[0]}:00, ${dateFormatted[1]}th ${dateFormatted[2]} ${dateFormatted[3]}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffA5A5A5),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              desc.split('[')[0],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: null,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Help us fight fake news',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffA5A5A5),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: RaisedButton(
              textColor: Theme.of(context).primaryColor,
              color: Theme.of(context).accentColor,
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.newspaper,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      "View More",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                      ),
                      maxLines: null,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                      title: title,
                      selectedUrl: urlParse,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              getReview(context, Icons.thumb_up, Color(0xff7CB342),
                  'This Article Was Helpful!'),
              SizedBox(width: 5),
              getReview(context, Icons.thumb_down, Color(0xffFFA726),
                  'This Article Was Not Helpful!'),
            ],
          )
        ],
      ),
    );
  }
}

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: WebView(
          // initialUrl: selectedUrl,
          initialUrl: 'https://truth-seekers-covid19.herokuapp.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
