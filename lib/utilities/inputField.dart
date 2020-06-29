import 'package:TruthSeekers/models/verificationModel.dart';
import 'package:TruthSeekers/utilities/index.dart';

Widget getTextField(
    BuildContext context, Future<Verification> verification, int type) {
  return Column(
    children: [
      TextField(
        maxLines: (type == 1) ? null : 1,
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
        ),
      ),
      SizedBox(height: 20),
      FutureBuilder<Verification>(
        future: verification,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: 200,
              height: 46,
              child: RaisedButton(
                  textColor: Theme.of(context).primaryColor,
                  color: Color(0xff7CB342),
                  elevation: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify News Article",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationComplete(
                          type: snapshot.data.result,
                          articles: snapshot.data.articles,
                          source: snapshot.data.source,
                        ),
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator(
            backgroundColor: Colors.white,
          );
        },
      ),
    ],
  );
}
