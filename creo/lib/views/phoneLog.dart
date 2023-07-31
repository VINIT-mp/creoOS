import 'package:flutter/material.dart';

class PhoneAppScreen extends StatelessWidget {
  // add the controller method that you want to listen to here
  const PhoneAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Implement overflow menu functionality
            },
          ),
        ],
      ),
      body: _buildRecentCallsList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.dialpad),
        onPressed: () {},
      ),
    );
  }

  Widget _buildRecentCallsList() {
    List<String> recentCalls = [
      "John Doe",
      "Jane Smith",
      "Michael Johnson",
      "Emma Lee",
    ];

    return ListView.builder(
      itemCount: recentCalls.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.phone),
          ),
          title: Text(recentCalls[index]),
          subtitle: const Text('Today, 10:30 AM'),
          trailing: const Icon(Icons.call),
          onTap: () {},
        );
      },
    );
  }
}
