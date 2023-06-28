import 'package:auto_route/auto_route.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_developer/app/app/extensions/extensions.dart';
import 'package:flutter_test_developer/app/app/ui/basket/basket_screen.dart';
import 'package:flutter_test_developer/app/app/ui/basket/bloc/basket_bloc.dart';
import 'package:flutter_test_developer/app/app/ui/router/cubit/router_cubit.dart';

import 'food/food_screen.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<NavigationModel> _listTabs = <NavigationModel>[];

  final Map<int, GlobalKey<NavigatorState>> _navKeys = <int, GlobalKey<NavigatorState>>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        top: false,
        child: BlocBuilder<RouterCubit, RouterState>(
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () async =>
                  !(await _navKeys[state.index]?.currentState?.maybePop() ?? false),
              child: IndexedStack(
                index: state.index,
                children: List<Widget>.generate(
                  _setTabs().length,
                  (index) => _buildScreen(page: _listTabs[index].screen),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BaseNavBar(),
    );
  }

  List<NavigationModel> _setTabs() {
    return _listTabs = <NavigationModel>[
      NavigationModel(
        key: GlobalKey<NavigatorState>(),
        title: context.localizations.food,
        icon: const Icon(Icons.shopping_basket),
        screen: const FoodScreen(),
      ),
      NavigationModel(
        key: GlobalKey<NavigatorState>(),
        title: context.localizations.basket,
        icon: const Icon(Icons.shopping_basket),
        screen: const BasketScreen(),
      ),
    ];
  }

  Navigator _buildScreen({required Widget page}) {
    return Navigator(
      observers: <NavigatorObserver>[HeroController()],
      onGenerateRoute: (route) => CupertinoPageRoute(
        settings: route,
        builder: (context) => page,
      ),
    );
  }
}

class BaseNavBar extends StatefulWidget {
  const BaseNavBar({Key? key}) : super(key: key);

  @override
  State<BaseNavBar> createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterCubit, RouterState>(builder: (context, state) {
      return BlocBuilder<BasketBloc, BasketState>(
        builder: (_, basketState) {
          return SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      enableFeedback: false,
                      icon: Icon(
                        Icons.fastfood,
                        color: state.index == RouterTabs.food.index ? Colors.black : Colors.grey,
                      ),
                      onPressed: () => context.read<RouterCubit>().setTab(RouterTabs.food),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        context.localizations.food,
                        style: TextStyle(
                          fontSize: 12,
                          color: state.index == RouterTabs.food.index ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      enableFeedback: false,
                      icon: Icon(
                        Icons.shopping_basket,
                        color: state.index == RouterTabs.basket.index ? Colors.black : Colors.grey,
                      ),
                      onPressed: () => context.read<RouterCubit>().setTab(RouterTabs.basket),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BasketBuilderWidget(selected: state.index == RouterTabs.basket.index),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }
}

class NavigationModel {
  final GlobalKey<NavigatorState> key;
  final String title;
  final Widget icon;
  final Widget screen;

  const NavigationModel({
    required this.key,
    required this.title,
    required this.icon,
    required this.screen,
  });
}

class BasketBuilderWidget extends StatefulWidget {
  final bool selected;

  const BasketBuilderWidget({Key? key, required this.selected}) : super(key: key);

  @override
  createState() => _BasketBuilderWidgetState();
}

class _BasketBuilderWidgetState extends State<BasketBuilderWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _price = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = _controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BasketBloc, BasketState>(
      listener: (_, state) {
        _price = state.getPrice();
        _animation = Tween<double>(
          begin: _animation.value,
          end: _price.toDouble(),
        ).animate(CurvedAnimation(
          curve: Curves.fastOutSlowIn,
          parent: _controller,
        ));

        _controller.forward(from: 0.0);
      },
      child: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          if (state.products.isEmpty) {
            return Text(
              context.localizations.basket,
              style: TextStyle(
                fontSize: 12,
                color: widget.selected ? Colors.black : Colors.grey,
              ),
            );
          }

          return AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              return Text(
                _animation.value.toStringAsFixed(0),
              );
            },
          );
        },
      ),
    );
  }
}
