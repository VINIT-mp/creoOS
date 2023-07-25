import 'package:flutter/material.dart';

class MessagesApp extends StatelessWidget {
  const MessagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MessagesScreen(),
    );
  }
}

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<String> _messages = [
    "Hello!",
    "How are you?",
    "Flutter is amazing!",
    "Send me a message.",
  ];

  TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages '),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageTile(_messages[index]);
              },
            ),
          ),
          Divider(height: 1),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageTile(String message) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: Text(message),
    );
  }

  Widget _buildInputField() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onChanged: (message) {
                // Update the message list in real-time as the user types
                setState(() {
                  _messages.add(message);
                });
              },
              onSubmitted: (message) {
                // Clear the input field when the user submits the message
                _messageController.clear();
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Add the message when the user presses the send button
              String message = _messageController.text.trim();
              if (message.isNotEmpty) {
                setState(() {
                  _messages.add(message);
                });
                _messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
