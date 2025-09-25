import 'package:appscrip_assignment_vishal_maurya/Views/UserListScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: UserListScreen(),
    );
  }
}
