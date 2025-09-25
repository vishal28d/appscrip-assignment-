import 'package:flutter/material.dart';
import '../Model/UserModel.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name , style: const TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF456882),
        leading: GestureDetector(child: const Icon(Icons.arrow_back, color: Colors.white,), onTap: ()=> Navigator.pop(context) ,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // User avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFF6A8CAF),
              child: Text(
                user.name.isNotEmpty ? user.name[0].toUpperCase() : "?",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // User info card
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              color: const Color(0xFFF5F5F5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(icon: Icons.email, label: "Email", value: user.email),
                    const SizedBox(height: 15),
                    InfoRow(icon: Icons.phone, label: "Phone", value: user.phone),
                    const SizedBox(height: 15),
                    InfoRow(icon: Icons.web, label: "Website", value: user.website),
                    const SizedBox(height: 15),
                    InfoRow(icon: Icons.business, label: "Company", value: user.company),
                    const SizedBox(height: 15),
                    InfoRow(icon: Icons.location_city, label: "City", value: user.city),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for info rows
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF456882)),
        const SizedBox(width: 12),
        Text(
          "$label: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
