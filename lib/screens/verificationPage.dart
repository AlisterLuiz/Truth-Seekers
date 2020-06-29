import 'package:TruthSeekers/models/verificationModel.dart';
import 'package:TruthSeekers/utilities/index.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  /// Active image file
  File _imageFile;
  Future<Verification> verificationText;
  Future<Verification> verificationUrl;

  /// Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      toolbarColor: Theme.of(context).backgroundColor,
      toolbarWidgetColor: Theme.of(context).primaryColor,
      statusBarColor: Theme.of(context).backgroundColor,
      toolbarTitle: 'Image Editor',
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  Widget build(BuildContext context) {
    verificationText = createText();
    verificationUrl = createUrl();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: DefaultTabController(
        length: 3,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify News Article',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Text(
                        'Check if a news article or a social media forward is from a trusted source or not.',
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
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'Search By',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                TabBar(
                  labelColor: Theme.of(context).primaryColor,
                  indicator: BoxDecoration(
                    color: Color(0xff7CB342),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  tabs: [
                    Center(
                      child: Container(
                        height: 40,
                        child: Center(
                          child: Text(
                            'Text',
                            style: TextStyle(
                              fontSize: 16,
                              // color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Center(
                        child: Text(
                          'URL',
                          style: TextStyle(
                            fontSize: 16,
                            // color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Center(
                        child: Text(
                          'Image',
                          style: TextStyle(
                            fontSize: 16,
                            // color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TabBarView(
                    children: [
                      getTextField(context, verificationText, 1),
                      getTextField(context, verificationUrl, 2),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            if (_imageFile != null) ...[
                              Image.file(_imageFile, height: 400, width: 300),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlatButton(
                                    child: Icon(Icons.crop, size: 30),
                                    onPressed: _cropImage,
                                  ),
                                  FlatButton(
                                    child: Icon(Icons.close, size: 30),
                                    onPressed: _clear,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Uploader(file: _imageFile),
                            ] else ...[
                              Icon(Icons.image, size: 150),
                              SizedBox(height: 10),
                              Text(
                                'Upload an image to verify',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              SizedBox(height: 10),
                              getButton(
                                context,
                                1,
                                200,
                                46,
                                Theme.of(context).accentColor,
                                "Browse for Images",
                                _pickImage,
                                [ImageSource.gallery],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
