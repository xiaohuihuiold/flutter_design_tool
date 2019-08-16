import 'package:flutter/material.dart';
import 'package:flutter_design_tool/common/widget/editor_menu_bar.dart';
import 'package:flutter_design_tool/common/widget/editor_scaffold.dart';
import 'package:flutter_design_tool/common/widget/editor_toolbar.dart';
import 'package:flutter_design_tool/common/editor/editor_view.dart';
import 'package:flutter_design_tool/generated/i18n.dart';

/// 编辑器页面
class EditorPage extends StatefulWidget {
  static const routerName = '/editor';

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    return EditorScaffold(
      menuBar: EditorMenuBar(
        menus: <EditorMenuItem>[
          EditorMenuItem(
            tooltip: S.of(context).save,
            child: Icon(Icons.save),
          ),
          EditorMenuItem(
            tooltip: S.of(context).undo,
            child: Icon(Icons.undo),
          ),
          EditorMenuItem(
            tooltip: S.of(context).redo,
            child: Icon(Icons.redo),
          ),
        ],
        menusFixed: <EditorMenuItem>[
          EditorMenuItem(
            tooltip: S.of(context).user,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
          EditorMenuItem(
            tooltip: S.of(context).preview,
            child: Icon(
              Icons.play_arrow,
              color: Colors.green,
            ),
          ),
          EditorMenuItem(
            tooltip: S.of(context).share,
            child: Icon(
              Icons.share,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      toolbar: EditorToolbar(
        tools: <EditorToolItem>[
          EditorToolItem(
            tooltip: '选择',
            icon: Icon(Icons.photo_size_select_small),
          ),
          EditorToolItem(
            tooltip:'放大',
            icon: Icon(Icons.zoom_in),
          ),
          EditorToolItem(
            tooltip:'缩小',
            icon: Icon(Icons.zoom_out),
          ),
          EditorToolItem(
            tooltip:'画线',
            icon: Icon(Icons.color_lens),
          ),
        ],
        toolsFixed: <EditorToolItem>[
          EditorToolItem(
            tooltip: '图层',
            icon: Icon(Icons.filter),
          ),
          EditorToolItem(
            tooltip: '更多',
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: EditorView(),
    );
  }
}
