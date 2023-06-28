import 'package:auto_route/annotations.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_developer/app/app/extensions/extensions.dart';
import 'package:flutter_test_developer/app/app/ui/basket/bloc/basket_bloc.dart';
import 'package:flutter_test_developer/app/app/ui/widgets/base_scaffold.dart';

import '../main_screen.dart';
import '../widgets/base_bottom_sheet.dart';
import 'detailed_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  final CategoryModel category;

  const ProductsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: _buildBody(context),
      automaticallyImplyLeading: true,
      appBarTitle: Text(category.categoryName),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: category.products.length,
      itemBuilder: (_, index) {
        final product = category.products[index];

        return GestureDetector(
          onTap: () => BaseBottomSheet.show(context,
              child: (_) => DetailedProductWidget(
                    product: product,
                  )),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(2, 3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.imageUrl),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        category.products[index].cost.formatCurrency(
                          context.localizations.currencySymbol,
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          fixedSize: const Size(40, 30),
                          backgroundColor: Colors.orange,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () => context.read<BasketBloc>().add(
                              BasketAddProduct(product: category.products[index]),
                            ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
