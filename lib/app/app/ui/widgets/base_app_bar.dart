import 'package:flutter/material.dart';
import 'package:flutter_test_developer/app/app/extensions/extensions.dart';

import '../../resources/constants.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final Widget? title;
  final double elevation;
  final double leadingWidth;
  final EdgeInsets? titlePadding;

  const BaseAppBar({
    Key? key,
    required this.automaticallyImplyLeading,
    required this.centerTitle,
    this.title,
    this.elevation = 0,
    this.leadingWidth = 58,
    this.titlePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: title,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      titleSpacing: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      leadingWidth: kLeadingWidth,
      leading: automaticallyImplyLeading
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: Navigator.of(context).maybePop,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
