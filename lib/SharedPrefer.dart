// Gerekli paketler: Flutter için temel UI öğeleri
import 'package:bim324mobiluygulamagelistirme/AppDrawer.dart';
import 'package:flutter/material.dart';
// SharedPreferences paketini içe aktar
import 'package:shared_preferences/shared_preferences.dart';


// Ana ekran widget'ı
class SharedPrefer extends StatefulWidget {
  final bool karanlikMod; // dışarıdan alınan tema bilgisi
  final Function(bool) onTemaDegisti; // tema değiştirici fonksiyon

  const SharedPrefer({
    super.key,    required this.karanlikMod,    required this.onTemaDegisti,
  });

  @override
  State<SharedPrefer> createState() => _SharedPreferState(); // durumu döndür
}

// Ana ekran durumu
class _SharedPreferState extends State<SharedPrefer> {
  final _controller = TextEditingController(); // metin kutusu kontrolcüsü
  String _ad = ''; // kullanıcı adı (görüntülenecek)

  @override
  void initState() {
    super.initState();
    _adiYukle(); // başlangıçta adı yükle
  }

  // shared_preferences'tan kullanıcı adını yükle
  void _adiYukle() async {
    final prefs = await SharedPreferences.getInstance(); // prefs al
    setState(() {
      _ad = prefs.getString('kullaniciAdi') ?? ''; // ad varsa al, yoksa boş
    });
  }

  // Kullanıcının girdiği adı kaydeder
  void _adiKaydet() async {
    final prefs = await SharedPreferences.getInstance(); // prefs al
    await prefs.setString('kullaniciAdi', _controller.text); // metni kaydet
    _adiYukle(); // ekranda güncelle
    _controller.clear(); // kutuyu temizle
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Shared Preferences Örneği"), // başlık
        actions: [
          Row(
            children: [
              const Text("🌙"), // ikon
              Switch(
                value: widget.karanlikMod, // dışarıdan gelen tema bilgisi
                onChanged: widget.onTemaDegisti, // dışarıya tema değiştirici çağrı
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // kenar boşluğu
        child: Column(
          children: [
            // Adı gösteren yazı
            Text("Hoş geldin, $_ad", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20), // boşluk
            // Ad girişi için metin kutusu
            TextField(
              controller: _controller, // kontrolcüyü bağla
              decoration: const InputDecoration(
                labelText: "Adınızı girin", // ipucu yazı
              ),
            ),
            const SizedBox(height: 10), // boşluk
            // Kaydetme butonu
            ElevatedButton(
              onPressed: _adiKaydet, // butona basınca ad kaydet
              child: const Text("Adı Kaydet"), // buton metni
            ),
          ],
        ),
      ),
    );
  }
}
