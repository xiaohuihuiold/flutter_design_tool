import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_design_tool/common/entity/window_info.dart';
import 'package:rxdart/rxdart.dart';

final windowBloc = WindowBloc();

/// 窗口信息bloc
class WindowBloc {
  final PublishSubject<WindowInfo> _windowFetcher =
      PublishSubject<WindowInfo>();

  Observable<WindowInfo> get stream => _windowFetcher.stream;

  /// 保存的窗口信息
  WindowInfo _value =
      WindowInfo(size: Size.infinite, windowDirection: Axis.vertical);

  WindowInfo get value => _value;

  /// 更新窗口信息
  /// 通常是大小方向改变时更新
  void update(WindowInfo info) {
    _value = info;
    _windowFetcher.sink.add(info);
  }

  void dispose() {
    _windowFetcher.close();
  }
}
