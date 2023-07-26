import 'package:creo/screens/calculator.dart';
import 'package:creo/main.dart';
import 'package:flutter/material.dart';

class MessagesApp extends StatelessWidget {
  const MessagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [
    ChatMessage(message: 'Hello!', isMe: false),
    ChatMessage(message: 'Hi there!', isMe: true),
    ChatMessage(message: 'How are you?', isMe: true),
    ChatMessage(message: 'I am good, thank you!', isMe: false),
    // Add more chat messages here
  ];

  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    if (_textController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(message: _textController.text, isMe: true));
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Messenger'),
        ),
        body: SafeArea(
          child: Column(children: [
            Expanded(
                child: SingleChildScrollView(
                    reverse: false,
                    child: Column(
                      children: _messages.map(_buildMessageBubble).toList(),
                    ))),
            const Divider(height: 1),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Type your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: message.isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String message;
  final bool isMe;

  ChatMessage({required this.message, required this.isMe});
}
