import 'package:bim324mobiluygulamagelistirme/AppDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CustomAppBar.dart';
import 'GirisServis.dart';

class AnaSayfa extends StatelessWidget {
  final User user;

  const AnaSayfa({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar( title: 'Ana Sayfa'),
      drawer: const AppDrawer(),
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