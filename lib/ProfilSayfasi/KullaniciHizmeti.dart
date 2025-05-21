// hizmetler/kullanici_hizmeti.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KullaniciHizmeti {
  final _auth = FirebaseAuth.instance;
  final _veritabani = FirebaseFirestore.instance;

  // Aktif kullanıcıyı döner
  User? get aktifKullanici => _auth.currentUser;

  // Kullanıcı bilgilerini Firestore'dan getirir
  Future<Map<String, dynamic>?> kullaniciBilgileriniGetir(String kullanici) async {
    //if (aktifKullanici == null) return null;
    final belge = await _veritabani.collection('kullanicilar').doc(kullanici).get();
    return belge.data();
  }

  // Kullanıcı bilgilerini Firestore'a kaydeder/günceller
  Future<void> kullaniciBilgileriniGuncelle({
    required String isim,
    required String biyografi,
    required String? profilResimUrl,
    required String? kullanici,
  }) async {
    //if (aktifKullanici == null) return;

    await _veritabani.collection('kullanicilar').doc(kullanici).set({
      'isim': isim,
      'biyografi': biyografi,
      'profilResimUrl': profilResimUrl,
    }, SetOptions(merge: true));
  }
}
