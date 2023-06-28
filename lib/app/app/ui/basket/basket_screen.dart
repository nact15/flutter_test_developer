import 'package:domain/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_developer/app/app/extensions/extensions.dart';
import 'package:flutter_test_developer/app/app/ui/router/cubit/router_cubit.dart';
import 'package:flutter_test_developer/app/app/ui/widgets/base_scaffold.dart';

import 'bloc/basket_bloc.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<RouterCubit>().setTab(RouterTabs.food);

        return Future.value(false);
      },
      child: BaseScaffold(
        body: _buildBody(context),
        appBarTitle: Text(context.localizations.basket),
        // automaticallyImplyLeading: true,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (_, state) {
        if (state.products.isEmpty) {
          return Center(
            child: Text(
              context.localizations.basketIsEmpty,
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: (_, __) => Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          itemCount: state.products.length,
          itemBuilder: (_, index) => _ProductCard(
            product: state.products[index],
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;

  const _ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          product.imageUrl,
          width: 100,
          height: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name),
            const SizedBox(height: 24),
            Text(
              product.cost.formatCurrencyLocalized(context.localizations),
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(product.sizes),
          ],
        ),
        const Spacer(),
        Container(
          width: 80,
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 26,
                height: 26,
                child: IconButton(
                  splashRadius: 15,
                  onPressed: () => context.read<BasketBloc>().add(BasketRemoveProduct(
                        product: product,
                      )),
                  icon: const Icon(Icons.remove),
                  color: Colors.black,
                  iconSize: 12,
                ),
              ),
              Text('${product.count}'),
              SizedBox(
                width: 26,
                height: 26,
                child: IconButton(
                  onPressed: () => context.read<BasketBloc>().add(BasketAddProduct(
                        product: product,
                      )),
                  splashRadius: 15,
                  icon: const Icon(Icons.add),
                  padding: EdgeInsets.zero,
                  color: Colors.black,
                  iconSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
