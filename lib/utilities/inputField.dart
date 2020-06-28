import 'package:TruthSeekers/utilities/index.dart';

Widget getTextField(BuildContext context, int type) {
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
      getButton(
        context,
        1,
        200,
        46,
        Color(0xff7CB342),
        "Verify News Article",
        null,
        [],
      ),
    ],
  );
}
