import 'package:flutter/material.dart';
import 'package:myaquaponic/src/screens/logins.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      color: Colors.blue,
      home: LoginScreen(),
    );
  }
}
