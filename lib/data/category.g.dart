// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      chid: json['CHID'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      totalVideos: json['total_videos'] as int,
      categoryUrl: json['category_url'] as String,
      coverUrl: json['cover_url'] as String);
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'CHID': instance.chid,
      'name': instance.name,
      'slug': instance.slug,
      'total_videos': instance.totalVideos,
      'category_url': instance.categoryUrl,
      'cover_url': instance.coverUrl
    };
