import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/bloc/screen_bloc.dart';
import 'common/entity/window_info.dart';
import 'common/style/themes.dart';
import 'common/widget/editor_scaffold.dart';
import 'common/widget/editor_toolbar.dart';
import 'generated/i18n.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
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
    return MaterialApp(
      title: 'FDT',
      theme: Themes.lightTheme,
      // 国际化
      // S.of(context).xxx进行使用
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: LayoutBuilder(
        builder: (buildContext, constraints) {
          // 根据最大宽高创建窗口信息
          Size size = Size(constraints.maxWidth, constraints.maxHeight);
          WindowInfo info = WindowInfo.fromSize(size);
          if (info != windowBloc.value) {
            // 如果窗口信息改变了就更新数据
            windowBloc.update(info);
          }
          return HomePage();
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return EditorScaffold(
      toolbar: EditorToolbar(
        tools: <EditorToolItem>[
          EditorToolItem(
            tooltip: '添加',
            icon: Icon(Icons.add),
            options: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ), ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ),
          EditorToolItem(
            tooltip: '删除',
            icon: Icon(Icons.delete),
            options: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ),
          EditorToolItem(
            tooltip: '查找',
            icon: Icon(Icons.search),
            options: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ),
          EditorToolItem(
            tooltip: '更新',
            icon: Icon(Icons.update),
            options: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ),
          EditorToolItem(
            tooltip: '编辑',
            icon: Icon(Icons.edit),
            options: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ),
        ],
        toolsFixed: <EditorToolItem>[
          EditorToolItem(
            tooltip: '图层',
            icon: Icon(Icons.filter),
            options: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ),
          EditorToolItem(
            tooltip: '更多',
            icon: Icon(Icons.more_vert),
            options: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    title: Text('Title'),
                    subtitle: Text('subtitle'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (_, __) {
          return ListTile(
            title: Text('Title'),
            subtitle: Text('subtitle'),
            trailing: Icon(Icons.more_vert),
          );
        },
      ),
    );
  }
}
