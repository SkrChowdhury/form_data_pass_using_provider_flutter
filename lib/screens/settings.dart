import 'package:flutter/material.dart';
import 'package:form_data_pass_using_provider_flutter/screens/account.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../navbar.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'settings_screen';

  final formKey = GlobalKey<FormState>();

  final Map data = {'name': String, 'email': String, 'age': int};

  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar: AppBar(title: const Text('Change Account Details')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    onSaved: (input) => data['name'] = input,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    onSaved: (input) => data['email'] = input,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Age'),
                    onSaved: (input) => data['age'] = input,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        formKey.currentState?.save();
                        Provider.of<Data>(context, listen: false)
                            .updateAccount(data);
                        formKey.currentState?.reset();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AccountScreen()));
                      },
                      child: const Text('Submit'))
                ]),
          ),
        ),
      ),
    );
  }
}
