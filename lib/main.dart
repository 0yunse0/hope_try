import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // 🔥 flutterfire configure로 생성된 파일
import 'login_page.dart';       // 로그인/회원가입 UI가 있는 페이지

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화 (Web은 옵션 필수)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth App',
      home: LoginPage(), // 로그인 UI가 홈으로 시작
    );
  }
}
