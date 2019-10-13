import 'package:json_annotation/json_annotation.dart';

import 'collection.dart';

part 'collections_response.g.dart';

@JsonSerializable()

class CollectionsResponse {
  @JsonKey(name: 'has_more')
  bool hasMore;

  @JsonKey(name: 'total_collections')
  int totalCollections;

  @JsonKey(name: 'current_offset')
  int currentOffset;

  @JsonKey(name: 'limit')
  int limit;

  @JsonKey(name: 'collections')
  List<Collection> collections;

  CollectionsResponse({
    this.hasMore,
    this.totalCollections,
    this.currentOffset,
    this.limit,
    this.collections});

  CollectionsResponse.fromJson(Map<String, dynamic> json) {
    hasMore = json['has_more'];
    totalCollections = json['total_collections'];
    currentOffset = json['current_offset'];
    limit = json['limit'];
    if (json['collections'] != null) {
      collections = new List<Collection>();
      json['collections'].forEach((v) {
        collections.add(new Collection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_more'] = this.hasMore;
    data['total_collections'] = this.totalCollections;
    data['current_offset'] = this.currentOffset;
    data['limit'] = this.limit;
    if (this.collections != null) {
      data['collections'] = this.collections.map((v) => v.toJson()).toList();
    }
    return data;
  }
}