// hizmetler/snackbar_bildirim.dart

import 'package:flutter/material.dart';

class SnackbarBildirim {
  // Başarılı işlem snackbar'ı
  static void gosterBasarili(BuildContext context, String mesaj) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesaj),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Hatalı işlem snackbar'ı
  static void gosterHata(BuildContext context, String mesaj) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesaj),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
