import 'package:flutter/material.dart';
import 'package:flutter_design_tool/common/widget/editor_menu_bar.dart';
import 'package:flutter_design_tool/common/widget/editor_scaffold.dart';
import 'package:flutter_design_tool/common/widget/editor_toolbar.dart';
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
            tooltip: '添加',
            icon: Icon(Icons.add),
          ),
          EditorToolItem(
            tooltip: '删除',
            icon: Icon(Icons.delete),
          ),
          EditorToolItem(
            tooltip: '查找',
            icon: Icon(Icons.search),
          ),
          EditorToolItem(
            tooltip: '更新',
            icon: Icon(Icons.update),
          ),
          EditorToolItem(
            tooltip: '编辑',
            icon: Icon(Icons.edit),
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
