import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';

part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodUseCase _foodUseCase;

  FoodBloc({required FoodUseCase foodUseCase})
      : _foodUseCase = foodUseCase,
        super(FoodState()) {
    on<FoodFetch>((event, emit) async {
      try {
        final categories = await _foodUseCase.getCategories();
        emit(state.copyWith(categories: categories));
      } catch (e) {
        log(e.toString());

        emit(state.copyWith(status: FoodStatus.error));
      }
    });
  }
}
