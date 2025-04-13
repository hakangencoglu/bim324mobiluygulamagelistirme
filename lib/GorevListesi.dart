import 'GorevEkle.dart';
import 'AppDrawer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GorevListesi extends StatelessWidget {
  const GorevListesi({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = GorevEkle.tasks; // Görevleri dinler

    return Scaffold(
      appBar: AppBar(title: const Text('Görev Listesi')),
      drawer: const AppDrawer(), // Drawer menüsü
      body: tasks.isEmpty
          ? const Center(child: Text('Henüz görev eklenmemiş.'))
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
          );
        },
      ),
    );
  }
}
