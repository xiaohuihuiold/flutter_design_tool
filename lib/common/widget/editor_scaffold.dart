import 'package:flutter/material.dart';
import 'package:flutter_design_tool/common/bloc/screen_bloc.dart';
import 'package:flutter_design_tool/common/entity/window_info.dart';

class EditorScaffold extends StatelessWidget {
  /// 主体
  /// 默认[Scaffold]的body
  final Widget body;

  /// 工具栏
  final List<Widget> tools;

  const EditorScaffold({Key key, this.body, this.tools})
      : assert(tools != null ? true : body != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget realBody;
    if (body != null && tools != null && tools.isNotEmpty) {
      realBody = StreamBuilder<WindowInfo>(
        stream: windowBloc.stream,
        initialData: windowBloc.value,
        builder: (context, snapshot) {
          Widget listTool = ListView.builder(
            itemCount: tools.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: snapshot.data.windowDirection == Axis.horizontal
                ? Axis.vertical
                : Axis.horizontal,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 1,
                child: tools[index],
              );
            },
          );

          if (snapshot.data.windowDirection == Axis.vertical) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                body,
                Container(
                  height: kToolbarHeight / 1.2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: listTool,
                    physics: BouncingScrollPhysics(),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
                  ),
                ),
              ],
            );
          } else {
            return Stack(
              alignment: AlignmentDirectional.centerStart,
              children: <Widget>[
                body,
                Container(
                  width: kToolbarHeight / 1.2,
                  child: listTool,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
                  ),
                ),
              ],
            );
          }
        },
      );
    } else {
      realBody = body;
    }
    return Scaffold(
      body: realBody,
    );
  }
}
