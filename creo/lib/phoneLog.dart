// import 'package:flutter/material.dart';

// class PhoneHomeScreen extends StatefulWidget {
//   const PhoneHomeScreen({super.key});

//   @override
//   _PhoneHomeScreenState createState() => _PhoneHomeScreenState();
// }

// class _PhoneHomeScreenState extends State<PhoneHomeScreen> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dialpad),
//             label: 'Dialer',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.contacts),
//             label: 'Contacts',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.call),
//             label: 'Call Log',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBody() {
//     switch (_currentIndex) {
//       case 0:
//         return DialerTab();
//       case 1:
//         return ContactsTab();
//       case 2:
//         return CallLogTab();
//       default:
//         return Container();
//     }
//   }
// }

// class DialerTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Icon(Icons.dialpad, size: 64),
//     );
//   }
// }

// class ContactsTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10, // Replace this with your actual contact list length
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             leading: CircleAvatar(
//               child: Icon(Icons.contacts_rounded),
//             ),
//             title: Text('Contact Name $index'),
//             subtitle: Text('Contact Number $index'),
//           ),
//         );
//       },
//     );
//   }
// }

// class CallLogTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10, // Replace this with your actual call log length
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             leading: CircleAvatar(
//               child: Icon(Icons.contacts_rounded),
//             ),
//             title: Text('Call Log $index'),
//             subtitle: Text('Call Duration: 2m $index'),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class PhoneAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
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
        onPressed: () {
          // Implement dial pad navigation
        },
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
