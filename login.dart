import 'package:flutter/material.dart';
import 'package:subhan/page3.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final String correctEmail = "subhansohail22@gmail.com";
  final String correctPassword = "subhan123";

  void login() {
    String email = emailController.text.trim();
    String pass = passController.text.trim();

    if (email.isEmpty || pass.isEmpty) {
      showMsg("All fields are required");
    } else if (email != correctEmail) {
      showMsg("Invalid Email");
    } else if (pass != correctPassword) {
      showMsg("Invalid Password");
    } else {
      showMsg("✅ Login Successful");
    }
  }

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Note())),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
