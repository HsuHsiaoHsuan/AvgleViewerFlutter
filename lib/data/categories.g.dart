// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
      success: json['success'] as bool,
      response: json['response'] == null
          ? null
          : CategoriesResponse.fromJson(
              json['response'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response
    };
