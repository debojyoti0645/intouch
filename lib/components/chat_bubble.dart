import 'package:flutter/material.dart';
import 'package:intouch/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  ChatBubble({super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    //light mode or dark mode colors
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode
                  ? Colors.green.shade500
                  : Colors.green.shade300)
              : (isDarkMode
                  ? Colors.grey.shade700
                  : Colors.blue.shade200),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: Text(message),
    );
  }
}
