import 'package:domain/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_developer/app/app/extensions/extensions.dart';

import '../basket/bloc/basket_bloc.dart';

class DetailedProductWidget extends StatelessWidget {
  final ProductModel product;

  const DetailedProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 24),
        Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Text(
              product.cost.formatCurrencyLocalized(context.localizations),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                fixedSize: const Size(80, 40),
                backgroundColor: Colors.orange,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () => context.read<BasketBloc>().add(
                    BasketAddProduct(product: product),
                  ),
              child: Text(context.localizations.want),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          product.description,
          style: const TextStyle(
            color: Colors.grey
          ),
        ),
      ],
    );
  }
}
