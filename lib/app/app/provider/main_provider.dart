import 'package:core/app_dependencies/app_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_developer/app/app/ui/basket/bloc/basket_bloc.dart';
import 'package:flutter_test_developer/app/app/ui/router/cubit/router_cubit.dart';

import '../ui/food/bloc/food_bloc.dart';

class MainProvider extends StatelessWidget {
  final Widget child;

  const MainProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FoodBloc(foodUseCase: injection())..add(FoodFetch()),
        ),
        BlocProvider(
          create: (_) => RouterCubit(),
        ),
        BlocProvider(
          create: (_) => BasketBloc(),
        )
      ],
      child: child,
    );
  }
}
