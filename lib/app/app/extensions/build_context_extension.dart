import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension<T> on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;

  void unfocus() => FocusScope.of(this).unfocus();

  void requestFocus([FocusNode? node]) => FocusScope.of(this).requestFocus(node);

  void nextFocus() => FocusScope.of(this).nextFocus();

  void pushNamedAndRemoveUntil(String path) => Navigator.of(this).pushNamedAndRemoveUntil(
        path,
        (_) => false,
      );

  Future<T?> push<T>(Widget page) => Navigator.of(this).push(CupertinoPageRoute(
        builder: (context) => page,
      ));

  void pop<T>([T? result]) => Navigator.of(this).pop(result);
}
