import 'package:flutter/material.dart';
import 'package:tutorials_testing/widget_tutorials/user_module/models/user_model.dart';
import 'package:tutorials_testing/widget_tutorials/user_module/repositories/user_repository.dart';
import 'package:http/http.dart';

class UserScreen extends StatefulWidget {
  final Future<List<User>> futureUsers;
  const UserScreen({
    super.key,
    required this.futureUsers,
  });

  @override
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: FutureBuilder<List<User>>(
            future: widget.futureUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<User> users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
