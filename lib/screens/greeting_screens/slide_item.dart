import 'package:TruthSeekers/utilities/index.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 350,
          // height: 300,
          child: Image.asset(slideList[index].imageUrl),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 32,
              height: 1.2,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 40.0),
        index == 6
            ? GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 2),
                              blurRadius: 6.0)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Enter Homi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
        SizedBox(
          height: 100.0,
        )
      ],
    );
  }
}
