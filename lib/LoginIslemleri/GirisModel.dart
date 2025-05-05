
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'GirisSayfasi.dart';
import 'GirisServis.dart';
import 'AnaSayfa.dart';

class GirisModel extends StatelessWidget {
  const GirisModel({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<GirisServis>(context);
    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user == null ? GirisSayfasi() : AnaSayfa(user: user);
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
