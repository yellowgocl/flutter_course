import 'package:course_book/api/index.dart';
import 'package:course_book/model/auth.dart';
import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/Log.dart';
import 'package:course_book/utils/widgetUtil.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var params = [100, 200];
    Widget parseWidget = BaseWidgetBuilder.buildFromMap({
      "widgetName": "Row",
      "alignment": 9,
      "color": "#ffffff",
      "children": [
        {
          "widgetName": "Text",
          "data": "分类1",
        },
        {
          "widgetName": 'Expanded',
          "flex": 1,
          "child": {
            "widgetName": "Text",
            "data": "分类2",
          }
        },
        {
          "widgetName": "Text",
          "data": "分类3",
        }
      ]
    }, context);

    return FutureBuilder<Auth>(
        future: Api.auth(),
        builder: (context, AsyncSnapshot<Auth> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: parseWidget,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.exit_to_app),
              onPressed: () {
                Api.auth().then((auth) {
                  Log.v(auth);
                });
                // Navigator.pushReplacementNamed(context, '/');
              },
            ),
          );
        });
  }
}
