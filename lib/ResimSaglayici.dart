import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ResimGoster extends ChangeNotifier {
  String _imageUrl = 'https://picsum.photos/200/300';

  String get imageUrl => _imageUrl;

  Future<void> fetchRandomImage() async {
    final response = await http.get(Uri.parse('https://picsum.photos/200/300'));
    if (response.statusCode == 200) {
      _imageUrl = response.request!.url.toString();
      notifyListeners();
    } else {
      throw Exception('Resim yüklenemedi');
    }
  }
}