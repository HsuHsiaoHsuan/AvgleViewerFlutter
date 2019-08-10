import 'package:avgle_viewer_flutter/data/categories_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()

class Categories {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'response')
  final CategoriesResponse response;

  Categories({
    this.success,
    this.response,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
/*
{
    "success":true,
    "response":{
        "categories":[
            {
                "CHID":"1",
                "name":"Pornstar・AV女優",
                "slug":"pornstar",
                "total_videos":350,
                "category_url":"https://avgle.com/videos/pornstar",
                "cover_url":"https://static.avgle.com/media/categories/video/1.jpg"
            },
            {
                "CHID":"2",
                "name": "JAV・日本AV",
                "slug":"jav",
                "total_videos":2500,
                "category_url":"https://avgle.com/videos/jav",
                "cover_url":"https://static.avgle.com/media/categories/video/2.jpg"
            },
            {
                "CHID":"3",
                "name": "Uncensored・無修正",
                "slug":"uncensored",
                "total_videos":1000,
                "category_url":"https://avgle.com/videos/uncensored",
                "cover_url":"https://static.avgle.com/media/categories/video/3.jpg"
            }
        ]
    }
}
*/