import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_design_tool/generated/i18n.dart';
import 'package:rxdart/rxdart.dart';

final localeBloc = LocaleBloc();

/// 本地化信息bloc
class LocaleBloc {
  final PublishSubject<Locale> _localeFetcher = PublishSubject<Locale>();

  Observable<Locale> get stream => _localeFetcher.stream;

  /// 保存的本地化信息
  Locale _value;

  Locale get value => _value;

  /// 更新本地化信息
  void change(int index) {
    Locale locale = S.delegate.supportedLocales[index];
    _localeFetcher.sink.add(locale);
  }

  void dispose() {
    _localeFetcher.close();
  }
}
