import 'package:domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryEntity {
  final int id;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'category_name')
  final String categoryName;
  final List<ProductEntity> products;

  CategoryEntity(
    this.id,
    this.imageUrl,
    this.categoryName,
    this.products,
  );

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => _$CategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
