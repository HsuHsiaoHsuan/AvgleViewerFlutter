import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:avgle_viewer_flutter/data/videos/videos.dart';

enum VideoViewState { Busy, DataRetrived, NoData }

class VideoModel {
  final StreamController<VideoViewState> _stateController =
    StreamController();

  Videos data;

  Stream<VideoViewState> get videoState => _stateController.stream;

  Future getVideos({int page = 0, String chid}) async {
    _stateController.add(VideoViewState.Busy);

    final response = await http.get("https://api.avgle.com/v1/videos/$page?c=$chid");

    if (response != null && response.statusCode == 200) {
      data = Videos.fromJson(json.decode(response.body));
      _stateController.add(VideoViewState.DataRetrived);
    } else {
      return _stateController.addError('Failed to load data');
    }
  }
}