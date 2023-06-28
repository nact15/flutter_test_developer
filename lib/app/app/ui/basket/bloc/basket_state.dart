part of 'basket_bloc.dart';

class BasketState {
  final List<ProductModel> products;

  int getPrice() {
    int price = 0;
    for (var product in products) {
      final productPrice = product.cost * product.count;
      price += productPrice;
    }

    return price;
  }

  BasketState({
    this.products = const [],
  });

  BasketState copyWith({List<ProductModel>? products}) {
    return BasketState(
      products: products ?? this.products,
    );
  }
}
