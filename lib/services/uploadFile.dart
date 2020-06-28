import 'package:TruthSeekers/utilities/index.dart';

class Uploader extends StatefulWidget {
  final File file;
  Uploader({this.file});
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://eosio-511fa.appspot.com');

  StorageUploadTask _uploadTask;

  /// Starts an upload task
  void _startUpload() {
    /// Unique file name for the file
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
              children: [
                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),

                if (_uploadTask.isInProgress)
                  FlatButton(
                    child: Icon(Icons.pause),
                    onPressed: _uploadTask.pause,
                  ),

                // Progress bar
                LinearProgressIndicator(
                  value: progressPercent,
                  // backgroundColor: Theme.of(context).primaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xff7CB342),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${(progressPercent * 100).toStringAsFixed(2)} % ',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                if (_uploadTask.isComplete)
                  getButton(context, 1, 200, 46, Color(0xff7CB342),
                      'Sent for Verification!', null, [])
              ],
            );
          });
    } else {
      // Allows user to decide when to start the upload
      return getButton(context, 1, 200, 46, Color(0xff7CB342),
          'Verify News Article', _startUpload, []);
    }
  }
}
