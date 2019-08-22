import 'package:flutter/material.dart';
import 'package:flutter_design_tool/generated/i18n.dart';

/// menu bar高度
const double editorMenuBarHeight = kToolbarHeight / 1.2;

/// 编辑器menu bar
class EditorMenuBar extends StatefulWidget implements PreferredSizeWidget {
  /// 菜单
  final List<EditorMenuItem> menus;

  /// 固定右边菜单
  final List<EditorMenuItem> menusFixed;

  const EditorMenuBar({
    Key key,
    this.menus,
    this.menusFixed,
  }) : super(key: key);

  @override
  _EditorMenuBarState createState() => _EditorMenuBarState();

  @override
  Size get preferredSize => Size.fromHeight(editorMenuBarHeight);
}

class _EditorMenuBarState extends State<EditorMenuBar> {
  /// 生成item
  List<Widget> _generateItem(List<EditorMenuItem> items) {
    return List.generate(items?.length ?? 0, (index) {
      EditorMenuItem item = items[index];
      return Tooltip(
        message:
            '${item.tooltip ?? S.of(context).what_is_this}${item.enabled == false ? '(${S.of(context).disabled})' : ''}',
        preferBelow: false,
        child: InkWell(
          onTap: item.enabled == false
              ? null
              : () {
                  if (item.onPressed != null) {
                    item.onPressed();
                  }
                },
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: item.child,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: editorMenuBarHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor.withOpacity(1.0),
          /* boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 4,
            ),
          ],*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _generateItem(widget.menus),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: _generateItem(widget.menusFixed),
            ),
          ],
        ),
      ),
    );
  }
}

/// 单个tool item类
class EditorMenuItem {
  /// 长按或者鼠标悬浮时的提示
  final String tooltip;

  /// 是否启用的当前item
  final bool enabled;

  /// 内容
  final Widget child;

  /// 如果点击后有展开选项,或者右键点击时展示的options
  final Widget options;

  /// 当左键点击,并且不需要展开options时触发
  final VoidCallback onPressed;

  EditorMenuItem({
    this.tooltip,
    this.enabled,
    @required this.child,
    this.options,
    this.onPressed,
  });
}
