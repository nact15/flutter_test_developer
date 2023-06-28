import 'package:flutter/material.dart';
import 'package:flutter_test_developer/app/app/extensions/build_context_extension.dart';

class BaseBottomSheet {
  static Future<dynamic> show(
    BuildContext context, {
    required Widget Function(BuildContext) child,
  }) async {
    FocusScope.of(context).unfocus();

    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      useRootNavigator: true,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      constraints: BoxConstraints(
        maxHeight: context.screenSize.height -
            MediaQueryData.fromView(WidgetsBinding.instance.window).padding.top,
      ),
      builder: (context) {
        return SafeArea(
          child: GestureDetector(
            onTap: context.unfocus,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 56,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: child(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
