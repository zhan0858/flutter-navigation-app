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
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Colors.yellow,
          onPrimary: Color.fromARGB(255, 119, 107, 0),
          secondary: Colors.purple,
          onSecondary: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          onError: Color.fromARGB(255, 143, 2, 2),
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        primarySwatch: Colors.yellow,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57),
          displayMedium: TextStyle(fontSize: 45),
          displaySmall: TextStyle(fontSize: 36),
          headlineLarge: TextStyle(fontSize: 32),
          headlineMedium: TextStyle(fontSize: 28),
          headlineSmall: TextStyle(fontSize: 24),
          titleLarge: TextStyle(fontSize: 22),
          titleMedium: TextStyle(fontSize: 16),
          titleSmall: TextStyle(fontSize: 14),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          bodySmall: TextStyle(fontSize: 12),
          labelLarge: TextStyle(fontSize: 14),
          labelMedium: TextStyle(fontSize: 12),
          labelSmall: TextStyle(fontSize: 11),
        ),
        iconTheme: const IconThemeData(
            color: Colors.yellow, opticalSize: 24, size: 24, weight: 400),
      ),
      home: const MainPage(),
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
        currentIndex: currentIndex,
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
