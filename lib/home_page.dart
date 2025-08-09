// home_page.dart
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: '로그아웃',
            onPressed: () async {
              await authService.signOut();
              // 스택을 비우고 로그인 페이지로 이동 (뒤로가기로 못 돌아오게)
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('로그인 성공!'),
            if (user?.email != null) ...[
              const SizedBox(height: 8),
              Text('이메일: ${user!.email}'),
            ],
          ],
        ),
      ),
    );
  }
}
