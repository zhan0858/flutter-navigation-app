import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/data_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = [
    const HomeScreen(),
    const DataScreen(),
    const ContactScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Navigation App week13",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: screens[currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Data"),
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Contact"),
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        backgroundColor: Colors.yellow,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: "Data"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: "Contact"),
        ],
        onTap: (value) => {
          setState(() {
            currentIndex = value;
          })
        },
      ),
    );
  }
}
