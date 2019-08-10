import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()

class Category {
  @JsonKey(name: 'CHID')
  final String chid;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'slug')
  final String slug;

  @JsonKey(name: 'total_videos')
  final int totalVideos;

  @JsonKey(name: 'category_url')
  final String categoryUrl;

  @JsonKey(name: 'cover_url')
  final String coverUrl;

  Category({
    this.chid,
    this.name,
    this.slug,
    this.totalVideos,
    this.categoryUrl,
    this.coverUrl
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

/*
{
  "CHID":"1",
  "name":"Pornstar・AV女優",
  "slug":"pornstar",
  "total_videos":350,
  "category_url":"https://avgle.com/videos/pornstar",
  "cover_url":"https://static.avgle.com/media/categories/video/1.jpg"
}
*/