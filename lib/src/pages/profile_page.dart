import 'package:final_project/src/repositories/user_repository.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserRepository _userRepository = UserRepository();

    return Scaffold(
        body: FutureBuilder(
      future: _userRepository.getUserData(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> data) {
        if (!data.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        print("XXXXX");
        print(data.data!['first_name']);
        final firstName = data.data!['first_name'];
        final lastName = data.data!['last_name'];
        final email = data.data!['email'];
        final avatar = data.data!['avatar'];

        return Container(
            margin: const EdgeInsets.all(50.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatar),
                  radius: 80,
                ),
                myListTile('Nombre', firstName),
                myListTile('Apellido', lastName),
                myListTile('Email', email)
              ],
            )));
      },
    ));
  }
}

Widget myListTile(label, valor) {
  return ListTile(
    title: Text(label,
        style: const TextStyle(
            fontWeight: FontWeight.normal, fontSize: 10, color: Colors.grey)),
    subtitle: Text(valor,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
  );
}
