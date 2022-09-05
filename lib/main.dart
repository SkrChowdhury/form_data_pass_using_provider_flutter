import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/account.dart';
import 'screens/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form with Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Form with Provider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(home: const AccountScreen(), routes: {
        'account_screen': (context) => const AccountScreen(),
        'settings_screen': (context) => SettingsScreen(),
      }),
    );
  }
}

class Data extends ChangeNotifier {
  Map data = {
    'name': 'Skr Chowdhury',
    'email': 'example@example.com',
    'age': 29
  };

  void updateAccount(input) {
    data = input;
    notifyListeners();
  }
}
