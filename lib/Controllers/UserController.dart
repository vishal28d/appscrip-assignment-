import 'dart:convert';
import 'package:appscrip_assignment_vishal_maurya/Model/UserModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
 

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;
  var error = "".obs;
  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      error("");
      final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {
      "Accept": "application/json",
      "User-Agent": "Mozilla/5.0",  
      },
);


      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        users.value = data.map((json) => User.fromJson(json)).toList();
      } else {
        error("Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      error("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  List<User> get filteredUsers {
    if (searchQuery.isEmpty) return users;
    return users
        .where((u) => u.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }
}
