import 'package:flutter/material.dart';

import 'package:avgle_viewer_flutter/videos_model.dart';
import 'package:avgle_viewer_flutter/videos_model.dart' as prefix0;

class VideosView extends StatefulWidget {
  final String chid;
  final String shortName;

  VideosView({
    Key key,
    @required this.chid,
    @required this.shortName}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideosViewState();
}

class VideosViewState extends State<VideosView> {
  final model = VideoModel();

  @override
  void initState() {
    print('This sould only be called once in videos_view.');
    model.getVideos(chid: widget.chid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shortName),
      ),
      body: Center(
        child: StreamBuilder(
          stream: model.videoState,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            if (!snapshot.hasData ||
                snapshot.data == VideoViewState.Busy) {
              return CircularProgressIndicator();
            }

            if (snapshot.data == VideoViewState.NoData) {
              return Text('Failed to laod data');
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2
                ),
                itemCount: model.data.response.videos.length,
                itemBuilder: (context, index) {
                  var tmp = model.data.response.videos[index];
                  return GestureDetector(
                    onTap: () => print(tmp.title),
                    child: Card(
                      semanticContainer: false,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderOnForeground: false,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 320 / 180,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.center,
                                      image: NetworkImage(tmp.previewUrl)
                                  )
                              ),
                            ),
                          ),
                          Text(
                            tmp.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                  );
//                  return Card(
//                    semanticContainer: false,
//                    clipBehavior: Clip.antiAliasWithSaveLayer,
//                    borderOnForeground: false,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(10.0)
//                    ),
//                    margin: EdgeInsets.all(5),
//                    child: Column(
//                      children: <Widget>[
//                        AspectRatio(
//                          aspectRatio: 320 / 180,
//                          child: Container(
//                            decoration: BoxDecoration(
//                              image: DecorationImage(
//                                fit: BoxFit.fitWidth,
//                                alignment: Alignment.center,
//                                image: NetworkImage(tmp.previewUrl)
//                              )
//                            ),
//                          ),
//                        ),
//                        Text(
//                          tmp.title,
//                          overflow: TextOverflow.ellipsis,
//                          maxLines: 2,
//                          softWrap: false,
//                        ),
//                      ],
//                    ),
//                  );
                });
          },
        ),
      ),
    );
  }
}