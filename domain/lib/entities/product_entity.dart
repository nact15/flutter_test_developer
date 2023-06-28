import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  final int id;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final int cost;
  final String sizes;
  final int categoryId;
  final String name;
  final String description;

  ProductEntity(
    this.id,
    this.imageUrl,
    this.cost,
    this.sizes,
    this.categoryId,
    this.description,
    this.name,
  );

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
