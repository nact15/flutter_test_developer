// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    ProductEntity(
      json['id'] as int,
      json['image_url'] as String,
      json['cost'] as int,
      json['sizes'] as String,
      json['categoryId'] as int,
      json['description'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'cost': instance.cost,
      'sizes': instance.sizes,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
    };
