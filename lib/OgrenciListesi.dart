import 'dart:convert';

import 'package:bim324mobiluygulamagelistirme/AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ogrenci.dart';

class OgrenciListesi extends StatefulWidget {
  @override
  State<OgrenciListesi> createState() => _OgrenciListesiState();
}
class _OgrenciListesiState extends State<OgrenciListesi> {
  List<Ogrenci> ogrenciler = [];
  @override
  void initState() {
    super.initState();    veriyiYukle();
  }
  Future<void> veriyiYukle() async {
    final String jsonStr = await rootBundle.loadString('assets/ogrenciler.json');
    final List<dynamic> veri = jsonDecode(jsonStr);
    setState(() { ogrenciler = veri.map((e) => Ogrenci.fromJson(e)).toList(); });
  }

  void ogrenciEkle() {
    final yeni = Ogrenci(id: DateTime.now().millisecondsSinceEpoch, ad: "Yeni", yas: 18);
    setState(() {
      ogrenciler.add(yeni);
    });
  }

  void ogrenciSil(int id) {
    setState(() {
      ogrenciler.removeWhere((o) => o.id == id);
    });
  }

  void ogrenciGuncelle(Ogrenci ogrenci) {
    showDialog(
      context: context,
      builder: (context) {
        final adCtrl = TextEditingController(text: ogrenci.ad);
        final yasCtrl = TextEditingController(text: ogrenci.yas.toString());
        return AlertDialog(
          title: const Text("Güncelle"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: adCtrl, decoration: InputDecoration(labelText: 'Ad')),
              TextField(controller: yasCtrl, decoration: InputDecoration(labelText: 'Yaş'), keyboardType: TextInputType.number),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  ogrenci.ad = adCtrl.text;
                  ogrenci.yas = int.tryParse(yasCtrl.text) ?? ogrenci.yas;
                });
                Navigator.pop(context);
              },
              child: Text("Kaydet"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const AppDrawer(),
      //appBar: AppBar(title: Text("Öğrenci Listesi")),
      body: ListView.builder(
        itemCount: ogrenciler.length,
        itemBuilder: (context, index) {
          final o = ogrenciler[index];
          return ListTile(
            title: Text(o.ad),            subtitle: Text("Yaş: ${o.yas}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: () => ogrenciGuncelle(o)),
                IconButton(icon: const Icon(Icons.delete), onPressed: () => ogrenciSil(o.id)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ogrenciEkle,
        child: const Icon(Icons.add),
      ),
    );
  }
}
