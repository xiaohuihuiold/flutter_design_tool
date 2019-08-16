import 'package:flutter/material.dart';
import 'package:flutter_design_tool/common/bloc/locale_bloc.dart';
import 'package:flutter_design_tool/page/editor/editor_page.dart';

/// 首页
class HomePage extends StatefulWidget {
  static const routerName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                localeBloc.change(1);
                Navigator.of(context).pushNamed(EditorPage.routerName);
              },
              child: Text('编辑器(中文)'),
            ),
            FlatButton(
              onPressed: () {
                localeBloc.change(0);
                Navigator.of(context).pushNamed(EditorPage.routerName);
              },
              child: Text('Editor(EN)'),
            ),
          ],
        ),
      ),
    );
  }
}
