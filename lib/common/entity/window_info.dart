import 'dart:ui';

import 'package:flutter/material.dart';

class WindowInfo {
  /// 窗口大小
  final Size size;

  /// 窗口方向
  final Axis windowDirection;

  WindowInfo({this.size, this.windowDirection});

  WindowInfo.fromSize(this.size)
      : this.windowDirection =
            (size.width > size.height) ? Axis.horizontal : Axis.vertical;

  @override
  bool operator ==(dynamic other) {
    if (other == null || other is! WindowInfo) {
      return false;
    }
    return size == other.size && windowDirection == other.windowDirection;
  }

  @override
  int get hashCode => hashValues(size.hashCode, windowDirection.hashCode);
}
