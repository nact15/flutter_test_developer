import 'dart:async';

import 'package:domain/domain.dart';

abstract class FoodRepository {
  Future<List<CategoryEntity>> getFood();
}