import 'package:TruthSeekers/utilities/index.dart';

Widget getButton(BuildContext context, int type, double width, double height,
    Color color, String text, Function func, List args) {
  return Container(
    width: width,
    height: height,
    child: RaisedButton(
        textColor: Theme.of(context).primaryColor,
        color: color,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
        onPressed: () {
          if (type == 1) {
            if (args.length != 0)
              for (var i in args) func(i);
            else
              func();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LearnMore(),
              ),
            );
          }
        }),
  );
}
