import 'package:flutter/material.dart';
import 'package:tutorials_testing/integration_tutorials/login_screen.dart';
import 'package:tutorials_testing/widget_tutorials/animation_module/animation_screen.dart';
import 'package:tutorials_testing/widget_tutorials/counter_module/counter_screen.dart';
import 'package:tutorials_testing/widget_tutorials/user_module/repositories/user_repository.dart';
// import 'package:tutorials_testing/unit_tutorials/user_module/views/user_screeen.dart';
import 'package:tutorials_testing/widget_tutorials/user_module/views/user_screeen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //unit Testing
      // home: const UserScreen(title: 'Flutter Demo Home Page'),
      // home: const CounterScreen(title: 'Flutter Demo Home Page'),
      //widget Testing
      // home: const CounterScreen(title: 'Flutter Demo Home Page'),
      // home: UserScreen(
      //   futureUsers: UserRepository().fetchUsers(),
      // ),
      // home: AnimationScreen(),
      home: const LoginPage(),
    );
  }
}
