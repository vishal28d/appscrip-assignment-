import 'package:appscrip_assignment_vishal_maurya/Views/UserDetailsPage.dart';
import 'package:flutter/material.dart';
import '../Model/UserModel.dart';
import 'package:get/get.dart';

class UserListCard extends StatelessWidget {
  final User user;

  const UserListCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF456882), // dark blue-gray
            Color(0xFF6A8CAF), // lighter shade
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white.withOpacity(0.8),
          child: Text(
            user.name.isNotEmpty ? user.name[0].toUpperCase() : "?",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF456882),
            ),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 18,
        ),
        onTap: () {
          Get.to(UserDetailScreen(user: user));
        },
      ),
    );
  }
}
