import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menü', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: const Text('Görev Ekle'),
            onTap: () => Navigator.pushReplacementNamed(context, '/addTask'),
          ),
          ListTile(
            title: const Text('Görev Listesi'),
            onTap: () => Navigator.pushReplacementNamed(context, '/taskList'),
          ),
          ListTile(
            title: const Text('Çıkış yap'),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
