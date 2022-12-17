import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/screens/StoreScreen/MainStore.dart';
import 'package:firebase_auth101/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String userid;

  const HomeScreen({Key? key, required this.username, required this.userid})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String? userName = FirebaseAuth.instance.currentUser?.displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.username, style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.grey[800],
                size: 36,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WelcomeScreen();
                }));
              },
            ),
          )
        ],
      ),
      body: StorePage(userid: widget.userid),
    );
  }
}
