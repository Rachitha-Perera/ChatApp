import 'package:flutter/material.dart';
import 'qr_scan_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildChatItem(String name, String message, String time) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Text(name[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(message,
          style: const TextStyle(color: Colors.grey, fontSize: 14)),
      trailing: Text(time, style: const TextStyle(color: Colors.grey)),
      onTap: () {
        // TODO: Navigate to chat page
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( // ✅ Wrap with DefaultTabController to prevent null issues
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat App"),
          backgroundColor: const Color(0xFF2575FC),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),

            IconButton(
              icon: Icon(Icons.qr_code_scanner),
              onPressed: () {
                Navigator.pushNamed(context, '/qr_scan');
              },
            )

          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Groups"),
              Tab(text: "Calls"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Chats Tab
            ChatsTab(),

            // Groups Tab
            GroupsTab(),

            // Calls Tab
            CallsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Start new chat
          },
          backgroundColor: const Color(0xFF2575FC),
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}

// ✅ Extracted widgets so TabBarView can be const-safe
class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ChatItem("Alice", "Hey, how are you?", "10:24 AM"),
        ChatItem("Bob", "Let's meet tomorrow", "09:58 AM"),
        ChatItem("Charlie", "Typing...", "Yesterday"),
      ],
    );
  }
}

class GroupsTab extends StatelessWidget {
  const GroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ChatItem("Flutter Devs", "Check this new update!", "11:45 AM"),
        ChatItem("Family", "Dinner at 8?", "Yesterday"),
        ChatItem("College Friends", "Exam postponed 🎉", "Mon"),
      ],
    );
  }
}

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ChatItem("Alice", "Missed voice call", "Yesterday"),
        ChatItem("David", "Video call • 5 min", "Mon"),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const ChatItem(this.name, this.message, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Text(name[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(message,
          style: const TextStyle(color: Colors.grey, fontSize: 14)),
      trailing: Text(time, style: const TextStyle(color: Colors.grey)),
    );
  }
}
