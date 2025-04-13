import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppDrawer.dart';


class GorevEkle extends StatelessWidget {
  GorevEkle({super.key});
  static List<String> tasks = [];
  final metinKontrolcusu = TextEditingController(); // Görev başlığını almak için kontrolör

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Görev Ekle')),
      drawer: const AppDrawer(), // Drawer menüsü
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: metinKontrolcusu,
              decoration: const InputDecoration(labelText: 'Görev Başlığı'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (metinKontrolcusu.text.isNotEmpty) {
                  tasks.add(metinKontrolcusu.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Görev eklendi')),
                  );
                }
              },
              child: const Text('Görev Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
