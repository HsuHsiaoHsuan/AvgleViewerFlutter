import 'package:flutter/material.dart';

import 'data/videos/video.dart';

class VideoDetailView extends StatelessWidget {
  final Video video;

  VideoDetailView({@required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(video.title)
          ],
        ),
      ),
    );
  }
}