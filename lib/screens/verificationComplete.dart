import 'package:TruthSeekers/utilities/index.dart';

class VerificationComplete extends StatelessWidget {
  final String type;
  final Map articles;
  final Map source;
  VerificationComplete({this.type, this.articles, this.source});

  Widget getNewsType(
      String source, IconData icon, Color col, String resultText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: col,
        ),
        SizedBox(height: 10),
        Text('Source: $source'),
        SizedBox(height: 10),
        Text(
          'This Article is from a $resultText News Source',
          textAlign: TextAlign.center,
          style:
              TextStyle(color: col, fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification Completed',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text(
                      'View the results below',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          (type == 'trusted')
              ? getNewsType(source['name'], Icons.check_circle_outline,
                  Color(0xff7CB342), 'Trusted')
              : (type == 'untrusted')
                  ? getNewsType(source['name'], Icons.warning,
                      Color(0xffFFA726), 'Untrusted')
                  : getNewsType(source['name'], FontAwesomeIcons.questionCircle,
                      Color(0xffA5A5A5), 'Unknown'),
          SizedBox(height: 20),
          (type == 'unknown')
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Disclaimer:',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'This article is not verfied yet and has been sent to the experts to validate. We suggest you to be cautious before sharing it with others! Wr are not resposible for any missundertanding cause.')
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (type == 'trusted')
                        ? Text(
                            'Here’s what we found',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          )
                        : Container(),
                    SizedBox(height: 10),
                    (type == 'trusted')
                        ? InkWell(
                            onTap: () {},
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          articles['articleFound']
                                              ['urlToImage']),
                                      fit: BoxFit.cover,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.19,
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
                                            articles['articleFound']['title'],
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
                                                    FontAwesomeIcons
                                                        .checkCircle,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    source['name'],
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
                                                    articles['articleFound']
                                                            ['rating']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
          SizedBox(height: 10),
          getButton(context, 2, 400, 46, Color(0xff7CB342),
              'Learn About Our Verfication Process', null, []),
        ],
      ),
    );
  }
}
