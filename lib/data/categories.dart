import 'package:json_annotation/json_annotation.dart';

import 'package:avgle_viewer_flutter/data/categories_response.dart';

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
    "success": true,
    "response": {
        "categories": [
            {
                "CHID": "1",
                "name": "Pornstar・AV女優",
                "slug": "pornstar",
                "total_videos": 7067,
                "shortname": "AV女優",
                "category_url": "https://avgle.com/videos/pornstar",
                "cover_url": "https://avgle.com/media/categories/video/1.jpg"
            },
            {
                "CHID": "2",
                "name": "JAV・日本AV",
                "slug": "jav",
                "total_videos": 53521,
                "shortname": "日本AV",
                "category_url": "https://avgle.com/videos/jav",
                "cover_url": "https://avgle.com/media/categories/video/2.jpg"
            },
            {
                "CHID": "3",
                "name": "Uncensored・無修正",
                "slug": "uncensored",
                "total_videos": 10732,
                "shortname": "無修正",
                "category_url": "https://avgle.com/videos/uncensored",
                "cover_url": "https://avgle.com/media/categories/video/3.jpg"
            },
            {
                "CHID": "4",
                "name": "Teen・ギャル・少女",
                "slug": "teen",
                "total_videos": 2311,
                "shortname": "少女",
                "category_url": "https://avgle.com/videos/teen",
                "cover_url": "https://avgle.com/media/categories/video/4.jpg"
            },
            {
                "CHID": "5",
                "name": "Amateur・素人",
                "slug": "amateur",
                "total_videos": 9372,
                "shortname": "素人",
                "category_url": "https://avgle.com/videos/amateur",
                "cover_url": "https://avgle.com/media/categories/video/5.jpg"
            },
            {
                "CHID": "6",
                "name": "Anal・アナル・肛交",
                "slug": "anal",
                "total_videos": 1300,
                "shortname": "Anal",
                "category_url": "https://avgle.com/videos/anal",
                "cover_url": "https://avgle.com/media/categories/video/6.jpg"
            },
            {
                "CHID": "7",
                "name": "Big Tits・巨乳",
                "slug": "tits",
                "total_videos": 3766,
                "shortname": "巨乳",
                "category_url": "https://avgle.com/videos/tits",
                "cover_url": "https://avgle.com/media/categories/video/7.jpg"
            },
            {
                "CHID": "8",
                "name": "Cosplay・コスプレ",
                "slug": "cosplay",
                "total_videos": 557,
                "shortname": "Cosplay",
                "category_url": "https://avgle.com/videos/cosplay",
                "cover_url": "https://avgle.com/media/categories/video/8.jpg"
            },
            {
                "CHID": "9",
                "name": "Schoolgirl・女子校生",
                "slug": "schoolgirl",
                "total_videos": 1451,
                "shortname": "校生",
                "category_url": "https://avgle.com/videos/schoolgirl",
                "cover_url": "https://avgle.com/media/categories/video/9.jpg"
            },
            {
                "CHID": "10",
                "name": "Wife・人妻",
                "slug": "wife",
                "total_videos": 8806,
                "shortname": "人妻",
                "category_url": "https://avgle.com/videos/wife",
                "cover_url": "https://avgle.com/media/categories/video/10.jpg"
            },
            {
                "CHID": "11",
                "name": "Mature・熟女",
                "slug": "mature",
                "total_videos": 2268,
                "shortname": "熟女",
                "category_url": "https://avgle.com/videos/mature",
                "cover_url": "https://avgle.com/media/categories/video/11.jpg"
            },
            {
                "CHID": "12",
                "name": "SM",
                "slug": "sm",
                "total_videos": 976,
                "shortname": "SM",
                "category_url": "https://avgle.com/videos/sm",
                "cover_url": "https://avgle.com/media/categories/video/12.jpg"
            },
            {
                "CHID": "13",
                "name": "China・中國",
                "slug": "cn",
                "total_videos": 15887,
                "shortname": "中國",
                "category_url": "https://avgle.com/videos/cn",
                "cover_url": "https://avgle.com/media/categories/video/13.jpg"
            },
            {
                "CHID": "14",
                "name": "Hong Kong 香港",
                "slug": "hk",
                "total_videos": 2821,
                "shortname": "香港",
                "category_url": "https://avgle.com/videos/hk",
                "cover_url": "https://avgle.com/media/categories/video/14.jpg"
            },
            {
                "CHID": "15",
                "name": "Japan・日本",
                "slug": "jp",
                "total_videos": 16766,
                "shortname": "日本",
                "category_url": "https://avgle.com/videos/jp",
                "cover_url": "https://avgle.com/media/categories/video/15.jpg"
            },
            {
                "CHID": "16",
                "name": "Korea・韓国・대한민국",
                "slug": "kr",
                "total_videos": 23283,
                "shortname": "韓国",
                "category_url": "https://avgle.com/videos/kr",
                "cover_url": "https://avgle.com/media/categories/video/16.jpg"
            },
            {
                "CHID": "17",
                "name": "Taiwan・台湾",
                "slug": "tw",
                "total_videos": 11387,
                "shortname": "台湾",
                "category_url": "https://avgle.com/videos/tw",
                "cover_url": "https://avgle.com/media/categories/video/17.jpg"
            },
            {
                "CHID": "18",
                "name": "Asian・アジア",
                "slug": "asian",
                "total_videos": 16041,
                "shortname": "亞洲",
                "category_url": "https://avgle.com/videos/asian",
                "cover_url": "https://avgle.com/media/categories/video/18.jpg"
            },
            {
                "CHID": "19",
                "name": "Western・金髪洋物",
                "slug": "west",
                "total_videos": 8482,
                "shortname": "金髪",
                "category_url": "https://avgle.com/videos/west",
                "cover_url": "https://avgle.com/media/categories/video/19.jpg"
            },
            {
                "CHID": "20",
                "name": "3D",
                "slug": "3d",
                "total_videos": 151,
                "shortname": "3D",
                "category_url": "https://avgle.com/videos/3d",
                "cover_url": "https://avgle.com/media/categories/video/20.jpg"
            },
            {
                "CHID": "21",
                "name": "VR 360・仮想現実",
                "slug": "vr",
                "total_videos": 2448,
                "shortname": "VR",
                "category_url": "https://avgle.com/videos/vr",
                "cover_url": "https://avgle.com/media/categories/video/21.jpg"
            },
            {
                "CHID": "22",
                "name": "Idol・偶像",
                "slug": "idol",
                "total_videos": 752,
                "shortname": "偶像",
                "category_url": "https://avgle.com/videos/idol",
                "cover_url": "https://avgle.com/media/categories/video/22.jpg"
            },
            {
                "CHID": "23",
                "name": "18+ Movie・映画・電影",
                "slug": "movie",
                "total_videos": 1355,
                "shortname": "映画",
                "category_url": "https://avgle.com/videos/movie",
                "cover_url": "https://avgle.com/media/categories/video/23.jpg"
            },
            {
                "CHID": "24",
                "name": "Anime・アニメ",
                "slug": "anime",
                "total_videos": 1976,
                "shortname": "Anime",
                "category_url": "https://avgle.com/videos/anime",
                "cover_url": "https://avgle.com/media/categories/video/24.jpg"
            }
        ]
    }
}
*/