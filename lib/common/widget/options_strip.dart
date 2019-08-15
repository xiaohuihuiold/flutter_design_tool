import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_design_tool/common/bloc/screen_bloc.dart';
import 'package:flutter_design_tool/common/entity/window_info.dart';

/// 弹出选项框
class OptionsStrip extends StatefulWidget {
  /// 是否启用
  final bool enabled;

  /// 触发的widget
  final Widget child;

  /// 触发后显示的widget
  final Widget options;

  /// 弹出框显示位置
  final AxisDirection direction;

  /// 波纹圆角
  final BorderRadius borderRadius;

  /// 点击回调
  final VoidCallback onPressed;

  const OptionsStrip({
    Key key,
    this.enabled,
    this.options,
    this.direction,
    this.child,
    this.borderRadius,
    this.onPressed,
  }) : super(key: key);

  @override
  _OptionsStripState createState() => _OptionsStripState();
}

class _OptionsStripState extends State<OptionsStrip> {
  OverlayEntry _overlayEntry;

  /// 展示选项菜单
  void _showOptions() {
    RenderBox box = context.findRenderObject();
    Offset offset = box.localToGlobal(Offset.zero);
    Size size = box.size;
    var overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.transparent,
        type: MaterialType.card,
        child: GestureDetector(
          onTap: () {
            _overlayEntry.remove();
            _overlayEntry = null;
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: CustomSingleChildLayout(
              delegate: _OptionsStripPositionDelegate(offset: offset),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 150.0,
                  margin: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: widget.options,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
    overlayState.insert(_overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.child,
      borderRadius: widget.borderRadius,
      onTap: widget.enabled == false
          ? null
          : () {
              if (widget.onPressed != null) {
                // 没有options仍然可以点击
                widget.onPressed();
              }
              if (widget.options == null) return;
              // 有options时展示菜单
              _showOptions();
            },
    );
  }
}

class _OptionsStripPositionDelegate extends SingleChildLayoutDelegate {
  final Offset offset;

  _OptionsStripPositionDelegate({
    @required this.offset,
  }) : assert(offset != null);

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return positionDependentBox(
      size: size,
      childSize: childSize,
      target: offset,
      preferBelow: false,
    );
  }

  @override
  bool shouldRelayout(_OptionsStripPositionDelegate oldDelegate) {
    return offset != oldDelegate.offset;
  }
}
