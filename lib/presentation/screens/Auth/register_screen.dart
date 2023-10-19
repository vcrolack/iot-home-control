import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarAuth(
          title: 'Join us!',
          subtitle: 'Enter your personal information',
          colorsGradient: [Color(0xffbc9cf7), Color(0xff54bbb9)],
        ),
        body: Column(children: [
          const _RegisterForm(),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Are you registered?'),
              TextButton(
                  onPressed: () {
                    context.pushReplacement('/auth/login');
                  },
                  child: const Text('Click here'))
            ],
          )
        ]));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 50,
        ),
        const TextField(
          decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Write your name and last name',
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 35,
        ),
        const TextField(
          decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Write your email',
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 35,
        ),
        const TextField(
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: '****',
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 35,
        ),
        const TextField(
          decoration: InputDecoration(
              labelText: 'birth date',
              hintText: 'Write your birth date like dd/mm/yyy',
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 35),
        ElevatedButton(onPressed: () {}, child: const Text('Register'))
      ]),
    );
  }
}
