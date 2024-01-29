
import 'package:flutter/material.dart';
import 'package:tutorials_testing/unit_tutorials/user_module/models/user_model.dart';
import 'package:tutorials_testing/unit_tutorials/user_module/repositories/user_repository.dart';
import 'package:http/http.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key, required this.title});

  final String title;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Future<User> getUsers = UserRepository(Client()).getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Text(
              '${snapshot.data}',
            ),
          );
        },
      ),
    );
  }
}