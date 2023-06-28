import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_developer/app/app/extensions/build_context_extension.dart';
import 'package:flutter_test_developer/app/app/extensions/extensions.dart';
import 'package:flutter_test_developer/app/app/ui/food/bloc/food_bloc.dart';
import 'package:flutter_test_developer/app/app/ui/products/products_screen.dart';
import 'package:flutter_test_developer/app/app/ui/widgets/base_scaffold.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: _buildBody(context),
      appBarTitle: Text(context.localizations.categories),
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
      return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: state.categories.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => context.push(ProductsScreen(category: state.categories[index])),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(2, 3),
                      blurRadius: 3
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(state.categories[index].imageUrl),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        state.categories[index].categoryName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
