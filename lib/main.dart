import 'package:course_book/config/application.dart';
import 'package:course_book/core/gameController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Application.instance.initialize(gameContrller: new GameContrller()).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Application.instance.gameContrller,
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            // Use the generator provided by Fluro package
            onGenerateRoute: Application.instance.router.generator));
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   _MyAppState() {
//     final router = Router();
//     RoutesController.configureRoutes(router);
//     Application.router = router;

//   }
//   @override
//   Widget build(BuildContext context) {
//     final app = MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/login',
//       // Use the generator provided by Fluro package
//       onGenerateRoute: Application.router.generator
//     );
//     Application.instance.initialize();
//     return app;
//   }
// }
