import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  final MyData _data = MyData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color.fromARGB(255, 119, 107, 0),
            onPrimary: Colors.black,
            secondary: Colors.purple,
            onSecondary: Colors.white,
            brightness: Brightness.light,
            error: Colors.red,
            onError: Color.fromARGB(255, 143, 2, 2),
            surface: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Want something? Tell us"),
          ),
          body: SafeArea(
              child: Form(
            key: _formStateKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    initialValue: "",
                    decoration: const InputDecoration(
                        labelText: "Name",
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Enter your name",
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _data.name = value ?? '';
                    },
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    initialValue: "",
                    decoration: const InputDecoration(
                        labelText: "Email",
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _data.email = value ?? '';
                    },
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    maxLines: 6,
                    minLines: 3,
                    initialValue: "",
                    decoration: const InputDecoration(
                        labelText: "Message",
                        icon: Icon(Icons.message),
                        border: OutlineInputBorder(),
                        hintText: "Enter your message",
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _data.email = value ?? '';
                    },
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formStateKey.currentState!.validate()) {
                        _formStateKey.currentState!.save();
                        print("Name: ${_data.name}");
                        print("Email: ${_data.email}");
                        print("Message: ${_data.message}");
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    label: Text("Send",
                        style: Theme.of(context).textTheme.headlineMedium),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}

class MyData {
  String name = '';
  String email = '';
  String message = '';
}
