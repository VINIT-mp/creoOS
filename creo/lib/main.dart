import 'package:creo/calculator.dart';
import 'package:creo/contacts.dart';
import 'package:creo/messagesApp.dart';
import 'package:creo/phoneLog.dart';
import 'package:creo/unlock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LollipopHomeScreen(),
    );
  }
}

class App {
  final String name;
  final IconData icon;

  App(this.name, this.icon);
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MyWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<App> apps = [
      App('Phone', Icons.phone),
      App('Messages', Icons.message),
      App('Contacts', Icons.contacts),
      // Add more apps here
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjust the number of columns as needed
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: apps.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Handle app tap here
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.blue,
                child: Icon(apps[index].icon, color: Colors.white),
              ),
              Text("${apps[index].name}"),
            ],
          ),
        );
      },
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////
///
///

class LollipopHomeScreen extends StatefulWidget {
  const LollipopHomeScreen({super.key});

  @override
  _LollipopHomeScreenState createState() => _LollipopHomeScreenState();
}

class _LollipopHomeScreenState extends State<LollipopHomeScreen> {
  int _currentIndex = 2;
  bool flick = false;
  bool visible = true;
  bool start = false;
  final List<Widget> _screens = [
    PhoneAppScreen(),
    CalculatorScreen(),
    const AllAppsScreen(),
    const MessagesApp(),
    ContactsApp(),
  ];

  @override
  void initState() {
    start = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: flick && _currentIndex == 2
            ? UnlockScreen()
            : _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          currentIndex: _currentIndex,
          onTap: (int index) {
            start = false;
            setState(() {
              _currentIndex = index;

              if (index == 2) {
                flick = !flick;
              } else {}
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.phone,
              ),
              label: 'Phone',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: 'All Apps',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
              ),
              label: 'Contacts',
            ),
          ],
        ));
  }
}

class AllAppsScreen extends StatelessWidget {
  const AllAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<App> apps = [
      App('Calculator', Icons.calculate),
      App('Messages', Icons.calendar_today),
      App('Calender', Icons.camera),
      App('Photos', Icons.browser_not_supported_outlined),
      App('Contacts', Icons.contacts),
      App('Downloads', Icons.download),
      App('Mail', Icons.mail),
      App('Phone', Icons.photo_camera),
      App('Contacts', Icons.phone),

      // Add more apps here
    ];
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/lollipop.jpg'), // Replace with your wallpaper image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Adjust the number of columns as needed
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: apps.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.blue,
                    child: Icon(apps[index].icon, color: Colors.white),
                  ),
                  Center(
                    child: Text(apps[index].name),
                  )
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}
