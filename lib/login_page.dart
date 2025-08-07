import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String status = '';
  final auth = FirebaseAuth.instance;

  Future<void> signUp() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() => status = '회원가입 성공!');
    } catch (e) {
      setState(() => status = '회원가입 실패: $e');
    }
  }

  Future<void> login() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() => status = '✅ 로그인 성공!');
    } catch (e) {
      setState(() => status = '❌ 로그인 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인 / 회원가입')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: '이메일'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: '비밀번호'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: const Text('회원가입'),
            ),
            ElevatedButton(
              onPressed: login,
              child: const Text('로그인'),
            ),
            const SizedBox(height: 20),
            Text(status, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
