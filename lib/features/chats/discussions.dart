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
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
                decoration: const BoxDecoration(color: accentColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Discussions',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: grayColor, size: 22),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search a discusion',
                                hintStyle: TextStyle(
                                  color: grayColor,
                                  fontSize: 15,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
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
                  padding: const EdgeInsets.only(bottom: 100),
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
                      message: 'Let talk about it next frida',
                      time: '03:15',
                      unreadCount: 4,
                      avatar: 'assets/jerome.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Ralph Edwards',
                      message: 'Send your cv in pdf',
                      time: '22:23',
                      unreadCount: 2,
                      avatar: 'assets/ralph.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Jhon Doe',
                      message: 'we received your docs',
                      time: '2d ago',
                      avatar: 'assets/jhon.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Mr Brandon',
                      message: 'Let discuss about it',
                      time: 'Yestarday',
                      avatar: 'assets/brandon.jpg',
                    ),
                    _buildChatItem(
                      context: context,
                      name: 'Bon Tertius',
                      message: 'Last weekend\'s mountain',
                      time: '4d ago',
                      unreadCount: 1,
                      avatar: 'assets/bon.jpg',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: lightGray,
              child: Icon(Icons.person, color: darkGray, size: 32),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 14, color: grayColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: unreadCount != null ? accentColor : grayColor,
                    fontWeight: unreadCount != null
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
                if (unreadCount != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    child: Center(
                      child: Text(
                        unreadCount.toString(),
                        style: const TextStyle(
                          fontSize: 11,
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
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.chat_bubble, color: whiteColor, size: 28),
    );
  }
}
