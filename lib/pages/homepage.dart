import 'package:flutter/material.dart';
import 'package:intouch/components/my_drawer.dart';
import 'package:intouch/components/user_tile.dart';
import 'package:intouch/pages/chat_page.dart';
import 'package:intouch/services/auth/auth_service.dart';
import 'package:intouch/services/chat/chat_services.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  // Chat & auth Services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("USERS", style: TextStyle(color: Colors.grey)),
            SizedBox(),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade800,
        elevation: 0,
      ),
      drawer: const MyDrawerWidget(),
      body: _buildUserList(),
    );
  }

  // Build for the list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // Enhanced error handling with detailed debugging
        if (snapshot.hasError) {
          print('HomePage StreamBuilder Error: ${snapshot.error}');
          print('Error type: ${snapshot.error.runtimeType}');

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 20),
                  Text(
                    "Error Loading Users",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Text(
                      "Details: ${snapshot.error.toString()}",
                      style: TextStyle(
                        color: Colors.red.shade800,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Force rebuild
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageView()),
                      );
                    },
                    icon: Icon(Icons.refresh),
                    label: Text("Retry"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Common fixes:\n• Check Firestore security rules\n• Verify internet connection\n• Ensure Users collection exists",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Loading users...", style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        }

        // Check if data is null or empty
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people_outline, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  "No Data Available",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "The user list is empty",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        // Check if the list is empty
        if (snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people_outline, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  "No Users Found",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Be the first to start chatting!",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        // Debug: Print user data
        print('Found ${snapshot.data!.length} users');
        for (var user in snapshot.data!) {
          print('User: $user');
        }

        // Filter out current user and build list
        final filteredUsers =
            snapshot.data!.where((userData) {
              return userData["email"] != _authService.getCurrentUser()!.email;
            }).toList();

        if (filteredUsers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_outline, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  "No Other Users",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "You're the only user so far!",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        // Build the list view
        return ListView.builder(
          itemCount: filteredUsers.length,
          itemBuilder: (context, index) {
            return _buildUserListItem(filteredUsers[index], context);
          },
        );
      },
    );
  }

  // Build individual list tile for user
  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    return UserTile(
      text: userData["email"] ?? "Unknown User",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChatPage(
                  receiverEmail: userData["email"] ?? "Unknown",
                  receiverID: userData["uid"] ?? "",
                ),
          ),
        );
      },
    );
  }
}
