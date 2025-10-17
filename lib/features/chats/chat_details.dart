import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;

  const ChatDetailScreen({super.key, required this.name});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            decoration: const BoxDecoration(color: whiteColor),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: blackColor),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: grayColor,
                  child: Icon(Icons.person, color: accentColor, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: blackColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'online',
                        style: TextStyle(
                          fontSize: 13,
                          color: accentColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.call_outlined,
                    color: blackColor,
                    size: 26,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: [
                _buildReceivedMessage(
                  'Good morning! How did you sleep last night?',
                ),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Good morning! I slept pretty well, thanks.\nHow about you?',
                ),
                const SizedBox(height: 12),
                _buildReceivedMessage(
                  'I had a decent sleep too. Any plans for today?',
                ),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Good morning! Not yet, just about to.\nWhat about you?',
                ),
                const SizedBox(height: 12),
                _buildReceivedMessage(
                  'I had some toast and coffee. Ready to\ntackle the day?',
                ),
                const SizedBox(height: 12),
                _buildAudioMessage(),
                const SizedBox(height: 12),
                _buildFileMessage(),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Good morning! How did you sleep last night?',
                ),
                const SizedBox(height: 12),
                _buildReceivedMessage(
                  'Good morning! How did you sleep last night?',
                ),
                const SizedBox(height: 12),
                _buildSentMessage(
                  'Good morning! How did you sleep last night?',
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: lightGray,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, color: blackColor, height: 1.4),
        ),
      ),
    );
  }

  Widget _buildSentMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, color: whiteColor, height: 1.4),
        ),
      ),
    );
  }

  Widget _buildAudioMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow, color: whiteColor, size: 32),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: List.generate(
                      15,
                      (index) => Container(
                        width: 3,
                        height: 12 + (index % 3) * 4,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              '0:20',
              style: TextStyle(
                fontSize: 13,
                color: whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: lightGray,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.description, color: whiteColor, size: 24),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'School_registration.pdf',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
            const Icon(Icons.download, color: accentColor, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: accentColor, width: 1.5),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(color: grayColor, fontSize: 15),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                      color: grayColor,
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: grayColor,
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(Icons.mic, color: whiteColor, size: 28),
          ),
        ],
      ),
    );
  }
}
