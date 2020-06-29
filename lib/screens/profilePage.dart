import 'package:TruthSeekers/utilities/index.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars3.githubusercontent.com/u/5159405?s=400&u=09c788de985a0e08509f69ab307344fcc47b0af6&v=4'),
                  maxRadius: 65,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Haris Foley',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Validator',
                style: TextStyle(
                  color: Color(0xffA5A5A5),
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/medal.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/rating.png',
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              dividerTheme: DividerThemeData(
                  color: Theme.of(context).colorScheme.background),
            ),
            child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: profileData.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: Card(
                      child: ExpansionTile(
                        leading: Icon(
                          profileData[i][0],
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          profileData[i][1],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        children: (i == 3)
                            ? [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Dark Mode',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Switch(
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      inactiveThumbColor:
                                          Theme.of(context).primaryColor,
                                      value: Provider.of<ThemeModel>(context,
                                              listen: false)
                                          .getTheme(),
                                      onChanged: (value) {
                                        setState(() {
                                          Provider.of<ThemeModel>(context,
                                                  listen: false)
                                              .toggleTheme();
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ]
                            : [],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
