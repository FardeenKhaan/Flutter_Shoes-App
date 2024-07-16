import 'package:flutter/material.dart';
import 'package:shoes_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 251, 48, 82),
          scaffoldBackgroundColor: Color.fromRGBO(248, 245, 245, 1.0),
          appBarTheme: AppBarTheme(color: Colors.transparent),
        ),
        home: const HomePage());
  }
}
