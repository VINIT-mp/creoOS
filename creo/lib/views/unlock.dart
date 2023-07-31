import 'dart:async';

import 'package:flutter/material.dart';

class UnlockScreen extends StatefulWidget {
  const UnlockScreen({super.key});

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  String _timeString = '';
  bool _isUnlocked = false;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timeString = DateTime.now().toString().substring(11, 19);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WallpaperBackground(),
          HomeIcons(timeString: _timeString),
        ],
      ),
    );
  }
}

class WallpaperBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/lollipop.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HomeIcons extends StatelessWidget {
  final String timeString;

  const HomeIcons({super.key, required this.timeString});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timeString,
            style: const TextStyle(
              fontSize: 60.0,
              color: Color.fromARGB(255, 56, 55, 55),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "${DateTime.now().day}-${DateTime.now().month} -${DateTime.now().year}",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class UnlockButton extends StatelessWidget {
  final VoidCallback onUnlock;

  UnlockButton({required this.onUnlock});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.0,
      left: 0,
      right: 0,
      child: Center(
        child: ElevatedButton(
          onPressed: onUnlock,
          child: Text(
            'Unlock',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
