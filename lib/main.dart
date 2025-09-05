import 'package:chatapp/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/Home_page.dart';
import 'pages/qr_scan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/signup": (context) => const SignUpPage(),
        "/qr_scan": (context) => QRScanPage(),
      },
    );
  }
}
