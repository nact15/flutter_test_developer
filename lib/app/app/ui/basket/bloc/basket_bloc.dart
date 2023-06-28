import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/models/product_model.dart';
import 'package:meta/meta.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketState()) {
    on<BasketAddProduct>((event, emit) {
      List<ProductModel>? products;
      if (event.product.count == 0) {
        products = [...state.products, event.product];
        event.product.count++;
      } else {
        event.product.count++;
      }
      emit(state.copyWith(products: products));
    });
    on<BasketRemoveProduct>((event, emit) {
      List<ProductModel>? products;
      if (event.product.count == 1) {
        products = [...state.products..remove(event.product)];
        event.product.count--;
      } else {
        event.product.count--;
      }
      emit(state.copyWith(products: products));
    });
  }
}
