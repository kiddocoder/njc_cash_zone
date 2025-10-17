import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/chats/chat_details.dart';

class DiscussionsScreen extends StatelessWidget {
  const DiscussionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 18),
                decoration: const BoxDecoration(color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Search a discussion',
                                hintStyle: const TextStyle(
                                  color: grayColor,
                                  fontSize: 13,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5E7EB),
                                    width: 0,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 90),
                  children: [
                    _buildChatItem(
                      context: context,
                      name: 'James Smith',
                      message: 'Last weekend\'s mountain',
                      time: '20:14',
                      unreadCount: 1,
                      avatar: 'assets/james.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Jerome Bell',
                      message: 'Let’s talk about it next Friday',
                      time: '03:15',
                      unreadCount: 4,
                      avatar: 'assets/jerome.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your CV in PDF',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your CV in PDF',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your CV in PDF',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your CV in PDF',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your CV in PDF',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your CV in PDF',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your CV in PDF',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Jhon Doe',
                      message: 'We received your docs',
                      time: '2d ago',
                      avatar: 'assets/jhon.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Mr Brandon',
                      message: 'Let’s discuss about it',
                      time: 'Yesterday',
                      avatar: 'assets/brandon.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(bottom: 100, right: 20, child: _buildFAB()),
        ],
      ),
    );
  }

  Widget _buildChatItem({
    required BuildContext context,
    required String name,
    required String message,
    required String time,
    int? unreadCount,
    required String avatar,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatDetailScreen(name: name)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: lightGray,
              child: Icon(Icons.person, color: darkGray, size: 26),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 13,
                      color: grayColor,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    color: unreadCount != null ? accentColor : grayColor,
                    fontWeight: unreadCount != null
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
                if (unreadCount != null) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Center(
                      child: Text(
                        unreadCount.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.chat_bubble, color: whiteColor, size: 24),
    );
  }
}
