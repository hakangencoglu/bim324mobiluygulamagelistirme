import 'package:flutter/material.dart';

class GirisEkrani extends StatelessWidget {
  GirisEkrani({super.key});
  final TextEditingController kullaniciAdiKontrolcusu = TextEditingController(); // Kullanıcı adı için controller.
  final TextEditingController parolaKontrolcusu = TextEditingController(); // Şifre için controller.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body:  Padding(
        padding: const EdgeInsets.all(16.0), // Sayfanın iç kenar boşluğu.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // İçeriği ortala.
          children: [
            TextField(
              controller: kullaniciAdiKontrolcusu, // Kullanıcı adı giriş alanı.
              decoration: const InputDecoration(labelText: "Kullanıcı Adı"), // Giriş kutusunun etiketi.
            ),
            TextField(
              controller: parolaKontrolcusu, // Şifre giriş alanı.
              obscureText: true, // Şifreyi gizlemek için kullanılır.
              decoration: const InputDecoration(labelText: "Şifre"),
            ),
            ElevatedButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, '/addTask'),
              }, // Butona basınca popup göster.
              child: const Text("Giriş Yap"),
            ),
          ],
        ),
      ),
      /*
      Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/addTask'),
          child: const Text('Login'),
        ),
      ),*/
    );
  }
}
