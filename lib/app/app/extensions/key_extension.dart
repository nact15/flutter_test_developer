import 'package:flutter/material.dart';

extension KeyExtension on GlobalKey {
  Offset? get offset {
    RenderBox? box = currentContext?.findRenderObject() as RenderBox?;
    Offset? offset = box?.localToGlobal(Offset.zero);

    return offset;
  }

  Size? get size {
    RenderBox? box = currentContext?.findRenderObject() as RenderBox?;
    Size? size = box?.size;

    return size;
  }

  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);

      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}