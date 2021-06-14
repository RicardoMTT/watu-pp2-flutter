import 'package:flutter/material.dart';
import 'package:probardispositivofisico/authentication/screens/login/form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _height,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
