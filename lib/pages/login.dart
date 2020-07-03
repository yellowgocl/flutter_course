import 'package:course_book/api/index.dart';
import 'package:course_book/model/auth.dart';
import 'package:course_book/utils/Log.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Auth>(
      future: Api.auth(),
      builder: (context, AsyncSnapshot<Auth> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Center(
            child: Text('Please Login'),
          ),
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