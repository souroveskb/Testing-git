import 'dart:developer';

import 'package:flutter/material.dart';

import 'counterbloc/counter_view.dart';
import 'login/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(title: "Login"),
        '/counter': (context) => CounterPageView(title: "counter page"),
      },
    );
  }
}

