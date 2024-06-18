import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../extensions/context.dart';
import '../providers/auth_provider.dart';
import '../widgets/button.dart';
import '../widgets/constrained_widget.dart';
import '../widgets/entry.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthProvider authProvider = Get.find();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  final loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 160),
                ConstrainedWidget(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GradientText(
                      'Hello'.tr,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                      textAlign: TextAlign.start,
                      colors: [
                        context.colorScheme.primary,
                        context.colorScheme.secondary,
                      ],
                    ),
                  ),
                ),
                ConstrainedWidget(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('& welcome back!'.tr),
                  ),
                ),
                const SizedBox(height: 24),
                // Email TextField
                ConstrainedWidget(
                  child: Entry(
                    controller: emailController,
                    hintText: 'Email'.tr,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 20),

                // Password TextField
                ConstrainedWidget(
                  child: Entry(
                    controller: passController,
                    obscureText: true,
                    hintText: 'Password'.tr,
                  ),
                ),

                // Login Button
                const SizedBox(height: 24),
                ConstrainedWidget(
                  child: Obx(
                    () => Button(
                      onTap: () => onLogin(context),
                      text: 'Login'.tr,
                      variant: ButtonVariant.primary,
                      loading: loading.value,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ConstrainedWidget(
                  child: Row(
                    children: [
                      Text('Don\'t have an account? '.tr),
                      TextButton(
                        onPressed: () => context.goNamed('register'),
                        child: Text('Register'.tr),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future onLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All fields are required'.tr),
        ),
      );
      return;
    }

    try {
      loading.value = true;
      await authProvider.login(email, password);
    } catch (e) {
      final err = e as ClientException;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            err.response['message'] ?? 'Unknown error'.tr,
          ),
        ),
      );
    } finally {
      // await Future.delayed(const Duration(milliseconds: 800));
      loading.value = false;
      if (context.mounted) {
        context.replace('/home');
      }
    }
  }
}
