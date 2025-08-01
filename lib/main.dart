import 'package:flutter/material.dart';
import 'package:stoicism/views/home/dashboard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stoic App',
        home: DashboardView());
  }
}
