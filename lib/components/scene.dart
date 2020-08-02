import 'package:course_book/model/course/course.dart';
import 'package:course_book/parse/builder.dart';
import 'package:flutter/material.dart';

class Scene extends StatefulWidget {
  final Point data;
  Scene(this.data);

  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder.buildFromMap(widget?.data?.scene, context);
  }
}
