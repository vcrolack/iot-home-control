import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  static const name = 'recovery-password-screen';

  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBarAuth(
            title: 'Get a new pass',
            subtitle: 'Write your email and waiting us!',
            colorsGradient: [Color(0xffF45DB9), Color(0xff54bbb9)]),
        body: Column(children: [
          _RecoveryPasswordForm(),
          SizedBox(
            height: 50,
          ),
        ]));
  }
}

class _RecoveryPasswordForm extends StatelessWidget {
  const _RecoveryPasswordForm();

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
              labelText: 'Email',
              hintText: 'Write your registered email',
              border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Send')),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}
