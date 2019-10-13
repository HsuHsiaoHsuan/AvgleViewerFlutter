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

  @JsonKey(name: 'shortname')
  final String shortname;

  @JsonKey(name: 'category_url')
  final String categoryUrl;

  @JsonKey(name: 'cover_url')
  final String coverUrl;

  Category({
    this.chid,
    this.name,
    this.slug,
    this.totalVideos,
    this.shortname,
    this.categoryUrl,
    this.coverUrl
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}