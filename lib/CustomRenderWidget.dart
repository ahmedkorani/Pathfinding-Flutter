import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRenderWidget extends SingleChildRenderObjectWidget {
  final int index;

  CustomRenderWidget({Widget child, this.index, Key key}) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderBox()..index = index;
  }

  @override
  void updateRenderObject(BuildContext context, CustomRenderBox renderObject) {
    renderObject..index = index;
  }
}

class CustomRenderBox extends RenderProxyBox {
  int index;
}