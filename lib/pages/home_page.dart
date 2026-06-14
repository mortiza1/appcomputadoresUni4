import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'computadores_page.dart';
import 'monitores_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Computadores'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MonitoresPage(),
                  ),
                );
              },
              child: const Text('CRUD Monitores'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ComputadoresPage(),
                  ),
                );
              },
              child: const Text('CRUD Computadores'),
            ),
          ],
        ),
      ),
    );
  }
}