import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = fetchAlbum();
  }

  Future<List<User>> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load Users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Theme.of(context).colorScheme.onError),
              ),
            );
          } else {
            final userList = snapshot.data!;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.yellow[200],
                    child: ListTile(
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                const Icon(Icons.person),
                                const SizedBox(width: 4),
                                Text(
                                  userList[index].name,
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                const Text("Email:"),
                                const SizedBox(width: 4),
                                Text(
                                  userList[index].email,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Website:"),
                                const SizedBox(width: 4),
                                Text(
                                  userList[index].website,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                          ]),
                    ));
              },
            );
          }
        },
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String website;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      website: json['website'],
    );
  }
}
