import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_home_control/presentation/providers/auth/auth_provider.dart';
import 'package:iot_home_control/presentation/providers/auth/login_form_provider.dart';
import 'package:iot_home_control/presentation/widgets/common/custom_text_form_field.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBarAuth(
            title: 'Login',
            automaticallyImplyLeading: false,
            subtitle: 'Enter your credentials to continue',
            colorsGradient: const [Color(0xffbc9cf7), Color(0xff54bbb9)]),
        body: SingleChildScrollView(
          child: Column(children: [
            const _LoginForm(),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Are you forgot your password?'),
                TextButton(
                    onPressed: () => context.go('/auth/password-recovery'),
                    child: const Text('Click here'))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previus, next) {
      if (next.errorMessage.isEmpty) return;
      _showSnackbar(context, next.errorMessage);
    });

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 50,
        ),
        CustomTextFormField(
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
          errorMessage:
              loginForm.isFormPosted ? loginForm.email.errorMessage : null,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomTextFormField(
          label: 'Password',
          obscureText: true,
          onChanged: ref.read(loginFormProvider.notifier).onPasswordChange,
          errorMessage:
              loginForm.isFormPosted ? loginForm.password.errorMessage : null,
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: loginForm.isPosting
                ? null
                : ref.read(loginFormProvider.notifier).onFormSubmit,
            child: const Text('Log in')),
        const SizedBox(
          height: 16,
        ),
        const Text('Or'),
        TextButton(
            onPressed: () => context.pushReplacement('/auth/register'),
            child: const Text('Join us!'))
      ]),
    );
  }
}
