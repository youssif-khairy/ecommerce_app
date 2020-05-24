import 'package:ecommerceapp/model/provider_brain.dart';
import 'package:ecommerceapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ProviderBrain(),
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
