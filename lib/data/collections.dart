import 'package:json_annotation/json_annotation.dart';

import 'collections_response.dart';

part 'collections.g.dart';

@JsonSerializable()

class Collections {
  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'response')
  CollectionsResponse response;

  Collections({
    this.success,
    this.response});

  Collections.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    response = json['response'] != null
        ? new CollectionsResponse.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}