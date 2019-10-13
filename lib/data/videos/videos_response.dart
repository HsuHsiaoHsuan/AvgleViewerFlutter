import 'package:json_annotation/json_annotation.dart';

import 'video.dart';

part 'videos_response.g.dart';

@JsonSerializable()

class VideosResponse {
  @JsonKey(name: 'has_more')
  bool hasMore;

  @JsonKey(name: 'total_videos')
  int totalVideos;

  @JsonKey(name: 'current_offset')
  int currentOffset;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'videos')
  List<Video> videos;

  VideosResponse({
    this.hasMore,
    this.totalVideos,
    this.currentOffset,
    this.limit,
    this.videos});

  VideosResponse.fromJson(Map<String, dynamic> json) {
    hasMore = json['has_more'];
    totalVideos = json['total_videos'];
    currentOffset = json['current_offset'];
    limit = json['limit'];
    if (json['videos'] != null) {
      videos = new List<Video>();
      json['videos'].forEach((v) {
        videos.add(new Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_more'] = this.hasMore;
    data['total_videos'] = this.totalVideos;
    data['current_offset'] = this.currentOffset;
    data['limit'] = this.limit;
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}