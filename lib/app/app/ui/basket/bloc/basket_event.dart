part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}

class BasketAddProduct extends BasketEvent {
  final ProductModel product;

  BasketAddProduct({required this.product});
}

class BasketRemoveProduct extends BasketEvent {
  final ProductModel product;

  BasketRemoveProduct({required this.product});
}
