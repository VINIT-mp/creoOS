import 'package:creo/views/calculator.dart';
import 'package:creo/views/contacts.dart';
import 'package:creo/helpers%20/helpers.dart';
import 'package:creo/views/messagesApp.dart';
import 'package:creo/views/phoneLog.dart';
import 'package:creo/views/unlock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const CreoItMain());
}
//new branch

class CreoItMain extends StatelessWidget {
  const CreoItMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LollipopHomeScreen(),
    );
  }
}

class LollipopHomeScreen extends StatefulWidget {
  const LollipopHomeScreen({super.key});

  @override
  LollipopHomeScreenState createState() => LollipopHomeScreenState();
}

class LollipopHomeScreenState extends State<LollipopHomeScreen> {
  int currentIndex = 2;
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
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: flick && currentIndex == 2
            ? const UnlockScreen()
            : _screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Color.fromARGB(255, 140, 195, 240),
          unselectedItemColor: Colors.black54,
          currentIndex: currentIndex,
          onTap: (int index) {
            start = false;
            setState(() {
              currentIndex = index;

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
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
              ),
              label: '',
            ),
          ],
        ));
  }
}

class AllAppsScreen extends StatelessWidget {
  const AllAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppsInAllApps> apps = [
      AppsInAllApps('Calculator', Icons.calculate),
      AppsInAllApps('Messages', Icons.message),
      AppsInAllApps('Calender', Icons.camera),
      AppsInAllApps('Photos', Icons.browser_not_supported_outlined),
      AppsInAllApps('Contacts', Icons.contacts),
      AppsInAllApps('Downloads', Icons.download),
      AppsInAllApps('Mail', Icons.mail),
      AppsInAllApps('Camera', Icons.photo_camera),
      AppsInAllApps('Phone', Icons.phone),
      AppsInAllApps("Settings", Icons.settings),
      AppsInAllApps("Drive", Icons.add_to_drive_outlined),
      AppsInAllApps("Maps", Icons.map_outlined),
      AppsInAllApps("GoogleTranslate", Icons.g_translate_rounded),
      AppsInAllApps("Play Books", Icons.play_lesson),
      AppsInAllApps("Files", Icons.drive_file_move_sharp),

      AppsInAllApps("Tinder", Icons.whatshot)

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
              onTap: () {
                if (index == 4) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ContactsApp()));
                } else if (index == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CalculatorScreen()));
                } else if (index == 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MessagesApp()));
                } else if (index == 8) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PhoneAppScreen()));
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color.fromARGB(0, 180, 175, 175),
                    child: Icon(apps[index].icon, color: Colors.white),
                  ),
                  Center(
                    child: Text(
                      apps[index].name,
                      style: TextStyle(color: Colors.grey[300]),
                    ),
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
