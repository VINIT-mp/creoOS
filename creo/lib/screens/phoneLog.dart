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
    // Replace this with your data source for recent calls
    List<String> recentCalls = [
      "John Doe",
      "Jane Smith",
      "Michael Johnson",
      "Emma Lee",
      // Add more recent calls here
    ];

    return ListView.builder(
      itemCount: recentCalls.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            // Replace this with contact's avatar or call icon
            child: Icon(Icons.phone),
          ),
          title: Text(recentCalls[index]),
          subtitle: Text('Today, 10:30 AM'), // Replace this with call time
          trailing: Icon(Icons.call),
          onTap: () {
            // Implement call details page navigation
          },
        );
      },
    );
  }
}
