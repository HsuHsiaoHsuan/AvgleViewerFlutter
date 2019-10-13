import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()

class Collection {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'keyword')
  String keyword;

  @JsonKey(name: 'cover_url')
  String coverUrl;

  @JsonKey(name: 'total_views')
  int totalViews;

  @JsonKey(name: 'video_count')
  int videoCount;

  @JsonKey(name: 'collection_url')
  String collectionUrl;

  Collection(
      {this.id,
        this.title,
        this.keyword,
        this.coverUrl,
        this.totalViews,
        this.videoCount,
        this.collectionUrl});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    keyword = json['keyword'];
    coverUrl = json['cover_url'];
    totalViews = json['total_views'];
    videoCount = json['video_count'];
    collectionUrl = json['collection_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['keyword'] = this.keyword;
    data['cover_url'] = this.coverUrl;
    data['total_views'] = this.totalViews;
    data['video_count'] = this.videoCount;
    data['collection_url'] = this.collectionUrl;
    return data;
  }
}