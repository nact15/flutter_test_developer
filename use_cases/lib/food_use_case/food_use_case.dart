import 'package:domain/api/food_repository.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/use_cases/food_use_case.dart';

class FoodUseCaseImpl implements FoodUseCase {
  final FoodRepository foodRepository;

  FoodUseCaseImpl(this.foodRepository);
  @override
  Future<List<CategoryModel>> getCategories() async {
    final categories = await foodRepository.getFood();

    return categories.map(CategoryModel.fromEntity).toList();
  }
}