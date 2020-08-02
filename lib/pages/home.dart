import 'package:course_book/components/inputs.dart';
import 'package:course_book/utils/log.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> options = [
    {"value": 1, "text": "选项1"},
    {"value": 2, "text": "选项2"},
    {"value": 3, "text": "选项3"}
  ];
  Map<String, dynamic> checked;
  @override
  Widget build(BuildContext context) {
    // checked = checked ?? options[1];
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RadioGroup<Map<String, dynamic>>(
        options: options,
        checked: checked,
        itemBuilder: (BuildContext context, Map<String, dynamic> value,
            Map<String, dynamic> groupValue,
            [int index]) {
          return Container(
            color: value == groupValue ? Colors.amber : Colors.blueGrey,
            child: Text(
              value['text'],
            ),
          );
        },
        onChanged: (value) => setState(() => (checked = value)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_backup_restore),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    );
  }
}
