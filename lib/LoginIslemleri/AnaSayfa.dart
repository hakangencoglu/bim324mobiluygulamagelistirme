import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'GirisServis.dart';

class AnaSayfa extends StatelessWidget {
  final User user;

  const AnaSayfa({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<GirisServis>(context, listen: false).signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hoşgeldiniz, ${user.email}'),
            SizedBox(height: 20),
            Text('Kullanıcı ID: ${user.uid}'),
          ],
        ),
      ),
    );
  }
}