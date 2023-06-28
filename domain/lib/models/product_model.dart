import 'package:domain/domain.dart';

class ProductModel {
  int id;
  String imageUrl;
  int cost;
  String sizes;
  int categoryId;
  String description;
  String name;
  int count;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.cost,
    required this.sizes,
    required this.categoryId,
    required this.description,
    required this.name,
    this.count = 0,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      categoryId: entity.categoryId,
      cost: entity.cost,
      description: entity.description,
      imageUrl: entity.imageUrl,
      sizes: entity.sizes,
      name: entity.name,
    );
  }
}
