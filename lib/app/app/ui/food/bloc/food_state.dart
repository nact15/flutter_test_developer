part of 'food_bloc.dart';

class FoodState {
  final List<CategoryModel> categories;
  final FoodStatus status;

  FoodState({
    this.categories = const [],
    this.status = FoodStatus.loading,
  });

  FoodState copyWith({
    List<CategoryModel>? categories,
    FoodStatus? status,
  }) {
    return FoodState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }
}

enum FoodStatus { loading, success, error }
