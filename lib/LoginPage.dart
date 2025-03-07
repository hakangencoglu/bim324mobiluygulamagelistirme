import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController kullaniciAdiKontrolcusu = TextEditingController(); // Kullanıcı adı için controller.
  final TextEditingController parolaKontrolcusu = TextEditingController(); // Şifre için controller.

  void loginPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Giriş Bilgileri"), // Popup başlığı.
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kullanıcı Adı: ${kullaniciAdiKontrolcusu.text}"), // Kullanıcı adını göster.
              Text("Şifre: ${parolaKontrolcusu.text}"), // Şifreyi göster.
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Popup'ı kapatma butonu.
              child: const Text("Tamam"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Sayfası")), // Üstte başlık çubuğu.
      body: Padding(
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
              onPressed: loginPopup, // Butona basınca popup göster.
              child: const Text("Giriş Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
