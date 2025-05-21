// hizmetler/depolama_hizmeti.dart

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class DepolamaHizmeti {
  final _depolama = FirebaseStorage.instance;
  final _veritabani = FirebaseFirestore.instance;
  final _kimlik = FirebaseAuth.instance;

  // Profil resmini Firebase Storage'a yükler ve URL'sini döner
  Future<String> profilResmiYukle(File resimDosyasi) async {
    final dosyaAdi = Uuid().v4();
    final dosyaYolu = 'profilResimleri/$dosyaAdi.jpg';
    final yedek = _depolama.ref().child(dosyaYolu);

    await yedek.putFile(resimDosyasi);
    final url = await yedek.getDownloadURL();

    // Firestore veritabanına URL'yi ve dosya yolunu kaydet
    final kullanici = _kimlik.currentUser;
    if (kullanici != null) {
      await _veritabani.collection('kullanicilar').doc(kullanici.uid).update({
        'profilResimUrl': url,
        'profilResimYolu': dosyaYolu,
      });
    }

    return url;
  }

  // Firebase Firestore'dan profil resmi URL'sini getirir
  Future<String?> profilResminiGetir() async {
    final kullanici = _kimlik.currentUser;
    if (kullanici != null) {
      final belge = await _veritabani.collection('kullanicilar').doc(kullanici.uid).get();
      return belge.data()?['profilResimUrl'];
    }
    return null;
  }
}
