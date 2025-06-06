import 'package:post_midterm/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:post_midterm/notifications.dart';
import 'package:post_midterm/notifications.dart' as NotificationService;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Account Information'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Logged in as ${snapshot.data?.email}'),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () => logout(context),
                    child: const Text('Logout'),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () async {
                      await NotificationService.createNotification(
                        id: 1,
                        title: 'Default Notification',
                        body: 'This is the body of the notification',
                        summary: 'Small summary',
                      );
                    },
                    child: const Text('Default Notification'),
                  )
                ],
              ),
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}