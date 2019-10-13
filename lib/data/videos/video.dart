import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()

class Video {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'keyword')
  String keyword;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'duration')
  double duration;

  @JsonKey(name: 'framerate')
  double framerate;

  @JsonKey(name: 'hd')
  bool hd;

  @JsonKey(name: 'addtime')
  int addtime;

  @JsonKey(name: 'viewnumber')
  int viewnumber;

  @JsonKey(name: 'likes')
  int likes;

  @JsonKey(name: 'dislikes')
  int dislikes;

  @JsonKey(name: 'video_url')
  String videoUrl;

  @JsonKey(name: 'embedded_url')
  String embeddedUrl;

  @JsonKey(name: 'preview_url')
  String previewUrl;

  @JsonKey(name: 'preview_video_url')
  String previewVideoUrl;

  @JsonKey(name: 'private')
  bool private;

  @JsonKey(name: 'vid')
  String vid;

  @JsonKey(name: 'uid')
  String uid;

  Video({
    this.title, this.keyword, this.channel, this.duration, this.framerate,
    this.hd, this.addtime, this.viewnumber, this.likes, this.dislikes,
    this.videoUrl, this.embeddedUrl, this.previewUrl,
    this.previewVideoUrl, this.private, this.vid, this.uid});

  Video.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    keyword = json['keyword'];
    channel = json['channel'];
    duration = json['duration'].toDouble();
    framerate = json['framerate'].toDouble();
    hd = json['hd'];
    addtime = json['addtime'];
    viewnumber = json['viewnumber'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    videoUrl = json['video_url'];
    embeddedUrl = json['embedded_url'];
    previewUrl = json['preview_url'];
    previewVideoUrl = json['preview_video_url'];
    private = json['private'];
    vid = json['vid'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['keyword'] = this.keyword;
    data['channel'] = this.channel;
    data['duration'] = this.duration;
    data['framerate'] = this.framerate;
    data['hd'] = this.hd;
    data['addtime'] = this.addtime;
    data['viewnumber'] = this.viewnumber;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['video_url'] = this.videoUrl;
    data['embedded_url'] = this.embeddedUrl;
    data['preview_url'] = this.previewUrl;
    data['preview_video_url'] = this.previewVideoUrl;
    data['private'] = this.private;
    data['vid'] = this.vid;
    data['uid'] = this.uid;
    return data;
  }
}