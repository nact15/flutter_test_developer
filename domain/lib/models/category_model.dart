import 'package:domain/domain.dart';

import 'product_model.dart';

class CategoryModel {
  int id;
  String imageUrl;
  String categoryName;
  List<ProductModel> products;

  CategoryModel({
    required this.id,
    required this.imageUrl,
    required this.categoryName,
    required this.products,
  });

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      imageUrl: entity.imageUrl,
      id: entity.id,
      categoryName: entity.categoryName,
      products: entity.products.map(ProductModel.fromEntity).toList()
    );
  }
}
