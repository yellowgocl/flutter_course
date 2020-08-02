import 'package:course_book/api/index.dart';
import 'package:course_book/components/inputs.dart';
import 'package:course_book/config/application.dart';
import 'package:course_book/core/gameController.dart';
import 'package:course_book/model/course/course.dart';
import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum RadioType { type0, type1 }

class LoginPage extends StatelessWidget {
  RadioType _radioType = RadioType.type0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Course>(
        future: Api.fetchCourse(),
        builder: (context, AsyncSnapshot<Course> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              application.gameContrller.course = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  title: Text('Login'),
                ),
                body: Stack(children: [
                  Consumer<GameContrller>(
                    builder: (context, value, child) =>
                        BaseWidgetBuilder.buildFromMap(
                            value?.currentPoint?.scene, context),
                  )
                ]),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.exit_to_app),
                  onPressed: () {
                    // application.gameContrller.reply(null);
                    // Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              );
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        });
  }
}
