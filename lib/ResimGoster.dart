import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ResimGoster.dart';
import 'ResimSaglayici.dart';


class ResimGoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resimSaglayici = Provider.of<ResimSaglayici>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Rastgele Resim')),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            resimSaglayici.yukleniyor
                ? CircularProgressIndicator()
                : resimSaglayici.imageURL != null
                ? Image.network(resimSaglayici.imageURL!)
                : Text("Henüz resim yüklenmedi"),
            ElevatedButton(
              onPressed: () {
                resimSaglayici.fetchRandomImage();
                },
              child: Text('Yeni Resim Getir'),
            ),
          ],
        ),
      )
    );
  }
}