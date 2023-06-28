import '../models/category_model.dart';

abstract class FoodUseCase {
  Future<List<CategoryModel>> getCategories();
}