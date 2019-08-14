import 'package:flutter/material.dart';
import 'package:flutter_design_tool/common/bloc/screen_bloc.dart';
import 'package:flutter_design_tool/common/entity/window_info.dart';
import 'package:rxdart/rxdart.dart';

/// 编辑器工具栏
class EditorToolbar extends StatefulWidget {
  /// 工具栏内容
  final List<EditorToolItem> tools;

  /// 工具栏固定内容
  final List<EditorToolItem> toolsFixed;

  const EditorToolbar({
    Key key,
    this.tools,
    this.toolsFixed,
  }) : super(key: key);

  @override
  _EditorToolbarState createState() => _EditorToolbarState();
}

class _EditorToolbarState extends State<EditorToolbar> {
  /// 鼠标悬浮
  PublishSubject<int> _hoverFetcher = PublishSubject<int>();
  PublishSubject<int> _hoverFixedFetcher = PublishSubject<int>();

  /// 选中的item下标
  int _activeIndex = -1;

  /// 生成tool list
  List<Widget> _generateToolList() {
    return List.generate(widget.tools.length, (index) {
      EditorToolItem item = widget.tools[index];
      return Tooltip(
        message: item.tooltip,
        preferBelow: false,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: MouseRegion(
            onHover: (_) {
              _hoverFetcher?.sink?.add(index);
            },
            onExit: (_) {
              _hoverFetcher?.sink?.add(-1);
            },
            child: InkWell(
              borderRadius: BorderRadius.circular(kToolbarHeight / 1.2),
              onTap: () {
                setState(() {
                  _activeIndex = index;
                });
                if (item.onPressed != null) {
                  item.onPressed();
                }
              },
              child: AnimatedSwitcher(
                reverseDuration: Duration(milliseconds: 1000),
                duration: Duration(milliseconds: 1000),
                child: StreamBuilder<int>(
                  stream: _hoverFetcher?.stream,
                  builder: (context, snapshot) {
                    return IconTheme.merge(
                      data: IconThemeData(color: () {
                        if (_activeIndex == index) {
                          return Colors.blue;
                        } else {
                          if (snapshot.data == index) {
                            return Colors.grey.shade900;
                          } else {
                            return Colors.grey.shade600;
                          }
                        }
                      }()),
                      child: item.icon,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// 生成固定tool list
  List<Widget> _generateToolFixedList() {
    return List.generate(widget.toolsFixed?.length ?? 0, (index) {
      EditorToolItem item = widget.toolsFixed[index];
      return Tooltip(
        message: item.tooltip,
        preferBelow: false,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: MouseRegion(
            onHover: (_) {
              _hoverFixedFetcher?.sink?.add(index);
            },
            onExit: (_) {
              _hoverFixedFetcher?.sink?.add(-1);
            },
            child: InkWell(
              borderRadius: BorderRadius.circular(kToolbarHeight / 1.2),
              onTap: () {
                if (item.onPressed != null) {
                  item.onPressed();
                }
              },
              child: StreamBuilder<int>(
                stream: _hoverFixedFetcher.stream,
                builder: (context, snapshot) {
                  return IconTheme.merge(
                    data: IconThemeData(color: () {
                      if (snapshot.data == index) {
                        return Colors.grey.shade900;
                      } else {
                        return Colors.grey.shade600;
                      }
                    }()),
                    child: item.icon,
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _hoverFetcher?.close();
    _hoverFetcher = null;
    _hoverFixedFetcher?.close();
    _hoverFixedFetcher = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WindowInfo>(
      stream: windowBloc.stream,
      initialData: windowBloc.value,
      builder: (context, snapshot) {
        // 窗口信息
        WindowInfo info = snapshot.data;
        // 固定工具栏显示位置
        AlignmentGeometry alignmentFixed;
        // tool偏移
        EdgeInsetsGeometry padding;
        // 工具栏滑动方向
        Axis scrollDirection;
        // 分割线
        Widget divider;
        // 工具栏宽高
        Size size;

        if (info.windowDirection == Axis.horizontal) {
          // 当显示是横向时
          alignmentFixed = AlignmentDirectional.bottomCenter;
          padding = EdgeInsets.only(
              bottom: (widget.toolsFixed?.length ?? 0) * kToolbarHeight / 1.2 +
                  ((widget.toolsFixed?.length ?? 0) > 0 ? 4 : 0));
          scrollDirection = Axis.vertical;
          divider = Container(
            height: 4.0,
            width: kToolbarHeight / 1.2 / 1.5,
            child: Divider(color: Theme
                .of(context)
                .dividerColor),
          );
          size = Size(kToolbarHeight / 1.2, null);
        } else {
          // 当显示是纵向时
          alignmentFixed = AlignmentDirectional.centerEnd;
          padding = EdgeInsets.only(
              right: (widget.toolsFixed?.length ?? 0) * kToolbarHeight / 1.2 +
                  ((widget.toolsFixed?.length ?? 0) > 0 ? 4 : 0));
          scrollDirection = Axis.horizontal;
          divider = Container(
            width: 4.0,
            height: kToolbarHeight / 1.2 / 1.5,
            child: VerticalDivider(color: Theme
                .of(context)
                .dividerColor),
          );
          size = Size(null, kToolbarHeight / 1.2);
        }
        return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .canvasColor
                .withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 4,
              ),
            ],
          ),
          child: Stack(
            alignment: alignmentFixed,
            children: <Widget>[
              Padding(
                padding: padding,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: scrollDirection,
                  child: Flex(
                    direction: scrollDirection,
                    mainAxisSize: MainAxisSize.min,
                    children: _generateToolList(),
                  ),
                ),
              ),
              Visibility(
                visible: widget.toolsFixed != null,
                child: Flex(
                  direction: scrollDirection,
                  mainAxisSize: MainAxisSize.min,
                  children: _generateToolFixedList()
                    ..insert(0, divider),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 单个tool item类
class EditorToolItem {
  /// 长按或者鼠标悬浮时的提示
  final String tooltip;

  /// 鼠标悬浮的图标颜色
  final Color hoverColor;

  /// 当点击/选中当前item时的图标颜色
  final Color activeColor;

  /// 是否启用的当前item
  final bool enabled;

  /// 是否点击时就暂时options
  final bool expanded;

  /// 默认图标
  final Widget icon;

  /// 鼠标悬浮时的图标
  /// 可与颜色同时使用
  final Widget hoverIcon;

  /// 当点击/选中时的图标
  /// 可与颜色同时使用
  final Widget activeIcon;

  /// 如果点击后有展开选项,或者右键点击时暂时的options
  final Widget options;

  /// 当左键点击,并且不需要展开options时触发
  final VoidCallback onPressed;

  EditorToolItem({
    this.tooltip,
    this.hoverColor,
    this.activeColor,
    this.enabled,
    this.expanded,
    @required this.icon,
    this.hoverIcon,
    this.activeIcon,
    this.options,
    this.onPressed,
  });
}
