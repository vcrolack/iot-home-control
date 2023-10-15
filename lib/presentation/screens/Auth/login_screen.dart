import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarAuth(
          title: 'Login',
          subtitle: 'Enter your credentials to continue',
          colorsGradient: [Color(0xffbc9cf7), Color(0xff54bbb9)]),
      body: Column(children: [
        const _LoginForm(),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Are you forgot your password?'),
            TextButton(onPressed: () {}, child: const Text('Click here'))
          ],
        )
      ]),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const TextField(
          decoration: InputDecoration(
              labelText: 'User',
              hintText: 'Write your user',
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: '****',
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Log in'))
      ]),
    );
  }
}
