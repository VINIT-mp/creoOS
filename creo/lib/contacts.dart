import 'package:flutter/material.dart';

class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContactsScreen(),
    );
  }
}

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<String> _contacts = [
    "John Doe",
    "Jane Smith",
    "Michael Johnson",
    "Emma Lee",
  ];

  List<String> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts.addAll(_contacts);
  }

  void _searchContacts(String query) {
    query = query.toLowerCase();
    setState(() {
      _filteredContacts = _contacts.where((contact) {
        return contact.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredContacts.length,
              itemBuilder: (context, index) {
                return _buildContactTile(_filteredContacts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: _searchContacts,
      decoration: const InputDecoration(
        hintText: 'Search contacts...',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget _buildContactTile(String contact) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(contact[0]), // Display the first letter of the contact name
      ),
      title: Text(contact),
      onTap: () {},
    );
  }
}
