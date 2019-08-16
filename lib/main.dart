import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/bloc/locale_bloc.dart';
import 'common/bloc/screen_bloc.dart';
import 'common/entity/window_info.dart';
import 'common/style/themes.dart';
import 'generated/i18n.dart';
import 'page/editor/editor_page.dart';
import 'page/home/home_page.dart';

void main() {
  //SystemChrome.setEnabledSystemUIOverlays([]);
  _setTargetPlatformForDesktop();
  runApp(MyApp());
}

/// 解决desktop错误
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      stream: localeBloc.stream,
      initialData: localeBloc.value,
      builder: (context, snapshot) {
        return LayoutBuilder(builder: (buildContext, constraints) {
          // 根据最大宽高创建窗口信息
          Size size = Size(constraints.maxWidth, constraints.maxHeight);
          WindowInfo info = WindowInfo.fromSize(size);
          if (info != windowBloc.value) {
            // 如果窗口信息改变了就更新数据
            windowBloc.update(info);
          }
          return MaterialApp(
            title: 'FDT',
            debugShowCheckedModeBanner: false,
            theme: Themes.lightTheme,
            // 国际化
            // S.of(context).xxx进行使用
            locale: snapshot.data,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: HomePage(),
            routes: <String, WidgetBuilder>{
              // 主页
              HomePage.routerName: (_) => HomePage(),
              // 编辑器页面
              EditorPage.routerName: (_) => EditorPage(),
            },
          );
        });
      },
    );
  }
}
