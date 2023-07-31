import 'package:flutter/material.dart';

class PhoneAppScreen extends StatelessWidget {
  const PhoneAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
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
          leading: CircleAvatar(
            child: Icon(Icons.phone),
          ),
          title: Text(recentCalls[index]),
          subtitle: Text('Today, 10:30 AM'), 
          trailing: Icon(Icons.call),
          onTap: () {
          },
        );
      },
    );
  }
}
