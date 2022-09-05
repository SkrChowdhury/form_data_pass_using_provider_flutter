import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../navbar.dart';

class AccountScreen extends StatelessWidget {
  static const String id = 'account_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: '),
            Text('Email: '),
            Text('Age: '),
          ],
        ),
      ),
    );
  }
}
