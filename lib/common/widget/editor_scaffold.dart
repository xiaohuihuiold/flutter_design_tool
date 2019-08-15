import 'package:flutter/material.dart';
import 'package:flutter_design_tool/common/bloc/screen_bloc.dart';
import 'package:flutter_design_tool/common/entity/window_info.dart';

/// 编辑器脚手架
/// 实现横竖屏菜单栏,自适应工具栏等
class EditorScaffold extends StatefulWidget {
  /// 工具栏在横屏时显示的位置
  final AlignmentDirectional toolsAlignment;

  /// 窗口主体内容
  final Widget body;

  /// 工具栏
  final Widget toolbar;

  const EditorScaffold({
    Key key,
    this.body,
    this.toolbar,
    this.toolsAlignment = AlignmentDirectional.centerStart,
  })  : // 工具栏不为空时必须要有body
        assert((toolbar != null) ? (body != null) : true),
        // 工具栏位置只能是左或者右
        assert(toolsAlignment == AlignmentDirectional.centerStart ||
            toolsAlignment == AlignmentDirectional.centerEnd),
        super(key: key);

  @override
  _EditorScaffoldState createState() => _EditorScaffoldState();
}

class _EditorScaffoldState extends State<EditorScaffold> {
  /// 构建工具栏
  Widget _buildTools() {
    return StreamBuilder<WindowInfo>(
      stream: windowBloc.stream,
      initialData: windowBloc.value,
      builder: (context, snapshot) {
        // 窗口信息
        WindowInfo info = snapshot.data;
        // 工具栏显示位置
        AlignmentGeometry alignment;
        // body偏移
        EdgeInsetsGeometry offset;

        if (info.windowDirection == Axis.horizontal) {
          // 当显示是横向时
          // 工具栏位置按照用户设置或者默认
          alignment = widget.toolsAlignment;
          if (alignment == AlignmentDirectional.centerStart) {
            offset = EdgeInsets.only(left: kToolbarHeight / 1.2);
          } else if (alignment == AlignmentDirectional.centerEnd) {
            offset = EdgeInsets.only(right: kToolbarHeight / 1.2);
          }
        } else {
          // 当显示是纵向时
          // 工具栏位置设置底部居中
          alignment = AlignmentDirectional.bottomCenter;
          offset = EdgeInsets.only(bottom: kToolbarHeight / 1.2);
        }
        return Stack(
          alignment: alignment,
          children: <Widget>[
            Container(
              margin: offset,
              child: widget.body,
            ),
            widget.toolbar,
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget realBody = widget.body;
    if (widget.toolbar != null) {
      // 有工具栏时向页面上添加工具栏
      realBody = _buildTools();
    }
    return Scaffold(
      body: realBody,
    );
  }
}
