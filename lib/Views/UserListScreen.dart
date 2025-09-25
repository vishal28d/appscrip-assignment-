import 'package:appscrip_assignment_vishal_maurya/Controllers/UserController.dart';
import 'package:appscrip_assignment_vishal_maurya/Widgets/UserListCard.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class UserListScreen extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('User List' , style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF456882),
        centerTitle: true,
  
        
      ),
      body: Column(
        children: [

         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              onChanged: (val) => controller.searchQuery.value = val,
              decoration: InputDecoration(
                hintText: "Search users by name",
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF456882)),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.error.isNotEmpty) {
                return Center(child: Text(controller.error.value));
              } else if (controller.filteredUsers.isEmpty) {
                return const Center(child: Text("No users found"));
              }

              return RefreshIndicator(
                onRefresh: controller.fetchUsers,
                child: ListView.builder(
                  itemCount: controller.filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.filteredUsers[index];
                    return UserListCard(user: user);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
