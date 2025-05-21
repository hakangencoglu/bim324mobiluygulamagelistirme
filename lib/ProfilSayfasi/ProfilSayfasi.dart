import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'KullaniciHizmeti.dart';
import 'DepolamaHizmeti.dart';
import 'SnackbarBildirim.dart';

class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasiDurumu createState() => _ProfilSayfasiDurumu();
}

class _ProfilSayfasiDurumu extends State<ProfilSayfasi> {
  final ImagePicker _resimSecici = ImagePicker();
  final _kullaniciHizmeti = KullaniciHizmeti();
  final _depolamaHizmeti = DepolamaHizmeti();

  final TextEditingController _isimDenetleyici = TextEditingController();
  final TextEditingController _biyografiDenetleyici = TextEditingController();
  File? _seciliResim;
  String? _profilResimUrl;

  @override
  void initState() {
    super.initState();
    _kullaniciProfilYukle();
  }

  // Firebase'den kullanıcı bilgilerini yükler
  Future<void> _kullaniciProfilYukle() async {
    try {

      final bilgiler = await _kullaniciHizmeti.kullaniciBilgileriniGetir("xb6T9JwraeZzQEnUprIJUGErRCl2");
      if (bilgiler != null) {
        _isimDenetleyici.text = bilgiler['isim'] ?? '';
        _biyografiDenetleyici.text = bilgiler['biyografi'] ?? '';
        setState(() {
          _profilResimUrl = bilgiler['profilResimUrl'];
        });
      }
    } catch (e) {
      SnackbarBildirim.gosterHata(context, "Bilgiler yüklenemedi.");
    }
  }

  // Kullanıcı bilgilerini Firebase'e kaydeder
  Future<void> _profiliGuncelle() async {
    try {
      String? resimUrl = _profilResimUrl;

      if (_seciliResim != null) {
        resimUrl = await _depolamaHizmeti.profilResmiYukle(_seciliResim!);
      }

      await _kullaniciHizmeti.kullaniciBilgileriniGuncelle(
        isim: _isimDenetleyici.text,
        biyografi: _biyografiDenetleyici.text,
        profilResimUrl: resimUrl,
        kullanici: "xb6T9JwraeZzQEnUprIJUGErRCl2",
      );

      setState(() {
        _profilResimUrl = resimUrl;
        _seciliResim = null;
      });

      SnackbarBildirim.gosterBasarili(context, "Profil güncellendi.");
    } catch (e) {
      SnackbarBildirim.gosterHata(context, "Profil güncellenemedi.");
    }
  }

  // Galeriden resim seçer
  Future<void> _resimSec() async {
    final secilen = await _resimSecici.pickImage(source: ImageSource.gallery);
    if (secilen != null) {
      setState(() {
        _seciliResim = File(secilen.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider resimGorunumu;
    if (_seciliResim != null) {
      resimGorunumu = FileImage(_seciliResim!);
    } else if (_profilResimUrl != null) {
      resimGorunumu = NetworkImage(_profilResimUrl!);
    } else {
      resimGorunumu = AssetImage('assets/default_avatar.png');
    }

    return Scaffold(
      appBar: AppBar(title: Text('Profil')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _resimSec,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: resimGorunumu,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _isimDenetleyici,
              decoration: InputDecoration(labelText: 'İsim'),
            ),
            TextField(
              controller: _biyografiDenetleyici,
              decoration: InputDecoration(labelText: 'Biyografi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _profiliGuncelle,
              child: Text('Profili Güncelle'),
            )
          ],
        ),
      ),
    );
  }
}
