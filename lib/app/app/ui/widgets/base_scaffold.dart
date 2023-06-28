import 'package:flutter/material.dart';
import 'package:flutter_test_developer/app/app/extensions/build_context_extension.dart';

import 'base_app_bar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBarTitle;
  final bool automaticallyImplyLeading;
  final bool appBarCenterTitle;
  final bool buildAppBar;
  final bool topSafe;
  final bool bottomSafe;
  final bool expandBody;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final bool extendBodyBehindAppBar;
  final bool showError;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.appBarTitle,
    this.automaticallyImplyLeading = true,
    this.appBarCenterTitle = false,
    this.buildAppBar = true,
    this.topSafe = true,
    this.bottomSafe = true,
    this.resizeToAvoidBottomInset = true,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBar,
    this.expandBody = false,
    this.bottomSheet,
    this.extendBodyBehindAppBar = false,
    this.showError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: GestureDetector(
        onTap: context.unfocus,
        child: Scaffold(
          extendBody: expandBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          bottomSheet: bottomSheet,
          floatingActionButton: floatingActionButton,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: buildAppBar
              ? (appBar ??
                  BaseAppBar(
                    title: appBarTitle,
                    automaticallyImplyLeading: automaticallyImplyLeading,
                    centerTitle: appBarCenterTitle,
                  ))
              : null,
          body: SafeArea(
            top: topSafe,
            bottom: bottomSafe,
            child: body,
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
