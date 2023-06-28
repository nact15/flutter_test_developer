import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:domain/api/food_repository.dart';
import 'package:domain/entities/category_entity.dart';
import 'package:flutter/foundation.dart';

class FoodRepositoryImpl implements FoodRepository {
  final Dio _dio;

  FoodRepositoryImpl(this._dio);

  @override
  Future<List<CategoryEntity>> getFood() async {
    final response = await _dio.get(
        '/moisey312/10b304f7b00ffd17535604f4b38ebe6a/raw/eeb0334ccf8e33fb4be7495a395ddc2ec22f3a75/test.json');
    final json = jsonDecode(response.data);
    if (json is List<dynamic>) {
      return json.map((e) => CategoryEntity.fromJson(e)).toList();
    }

    return [];
  }
}
