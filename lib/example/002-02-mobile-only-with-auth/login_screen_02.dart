import 'package:flutter/material.dart';
import 'package:navigator_2_0/example/viewmodels/auth_view_model.dart';
import 'package:navigator_2_0/example/widgets/in_progress_message.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;

  const LoginScreen({Key? key, required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: authViewModel.logingIn
            ? InProgressMessage(progressName: "Login", screenName: "LoginScreen")
            : ElevatedButton(
                onPressed: () async {
                  final result = await authViewModel.login();
                  if (result == true) onLogin();
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Log in'),
                ),
              ),
      ),
    );
  }
}
