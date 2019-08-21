import 'package:flutter/services.dart';

/// 鼠标样式插件
class CursorStylePlugin {
  static const MethodChannel _methodChannel =
      const MethodChannel('com.xhhold.flutter.tool.design/plugin/cursor_style');

  static setStyle() {
    _methodChannel.invokeMethod('setStyle');
  }
}
