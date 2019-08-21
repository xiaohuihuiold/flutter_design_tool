import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:shortcut_keys/shortcut_keys.dart';

/// 编辑器动作类型
enum EditorViewActionType {
  /// 普通
  /// 鼠标滚轮只会使得画布上下移动
  normal,

  /// 移动画布
  /// 鼠标或者手指操作画布上下左右移动
  translate,

  /// 缩放画布
  /// 鼠标滚轮进行放大缩小
  /// 手指拖动seek bar进行放大缩小
  scale,
}

/// 编辑器视图
/// 主要处理事件以及手势操作
class EditorView extends StatefulWidget {
  @override
  _EditorViewState createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  /// 编辑器焦点
  /// 拥有焦点则可以使用快捷键
  FocusNode _editorFocus = FocusNode();

  /// 当鼠标进入编辑器区域时
  void _onMouseEnter(PointerEnterEvent event) {
    // 注册编辑器的焦点
    FocusScope.of(context).requestFocus(_editorFocus);
  }

  /// 当鼠标退出编辑器区域时
  void _onMouseExit(PointerExitEvent event) {
    // 注册一个新的焦点
    // 使得旧的焦点失效
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<ShortcutData> test() {
    return [
      ShortcutData(
        shortcuts: [ShortcutKeys.CTRL_LEFT, ShortcutKeys.C],
        trigger: () {
          print('复制');
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ShortcutKeysListener(
      focusNode: _editorFocus,
      onMouseEnter: _onMouseEnter,
      onMouseExit: _onMouseExit,
      shortcutData: [
        ...test(),
        ShortcutData(
          shortcuts: [ShortcutKeys.CTRL_LEFT, ShortcutKeys.S],
          trigger: () {
            print('保存');
          },
        ),
      ],
      child: Container(
        child: _EditorSketch(),
      ),
    );
  }
}

/// 编辑器画板
/// 主要处理图形绘制
class _EditorSketch extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return _EditorSketchRenderBox();
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {}
}

class _EditorSketchRenderBox extends RenderBox {
  @override
  void performResize() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
  }

  @override
  bool hitTest(BoxHitTestResult result, {Offset position}) {
    if (size.contains(position)) {
      result.add(BoxHitTestEntry(this, position));
      return true;
    }
    return false;
  }

  @override
  bool get sizedByParent => true;
}
