// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) =>
    CategoryEntity(
      json['id'] as int,
      json['image_url'] as String,
      json['category_name'] as String,
      (json['products'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'category_name': instance.categoryName,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
