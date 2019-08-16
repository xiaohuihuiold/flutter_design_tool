import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// 编辑器视图
/// 主要处理事件以及手势操作
class EditorView extends StatefulWidget {
  @override
  _EditorViewState createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {

  /// 键盘事件
  void _handleRawKeyEvent(RawKeyEvent event) {
    print(event);
  }

  @override
  void initState() {
    super.initState();
    RawKeyboard.instance.addListener(_handleRawKeyEvent);
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleRawKeyEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
          onHover: (event) {
            // 鼠标悬浮
            print(event);
          },
          onEnter: (event) {
            // 鼠标指针进入区域时
            print(event);
          },
          onExit: (event) {
            // 鼠标指针退出区域时
            print(event);
          },
          child: Listener(
            onPointerSignal: (event) {
              // 滚轮信号
              print(event);
            },
            onPointerMove: (event) {
              // 点击后移动
              print(event);
            },
            onPointerDown: (event) {
              // 左键(鼠标)按下
              print(event);
            },
            onPointerCancel: (event) {
              // 取消
              print(event);
            },
            onPointerUp: (event) {
              // 抬起
              print(event);
            },
            child: _EditorSketch(),
          ),
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
