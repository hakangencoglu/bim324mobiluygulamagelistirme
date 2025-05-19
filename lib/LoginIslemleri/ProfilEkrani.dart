import 'dart:io';
import 'package:bim324mobiluygulamagelistirme/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart' ;

import '../CustomAppBar.dart';

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({super.key});

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  final supabase = Supabase.instance.client;
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  Future<String?> _uploadImage(File file, String userId) async {
    final path = 'profile_photos/$userId.jpg';
    await supabase.storage.from('avatars').upload(path, file, fileOptions: const FileOptions(upsert: true));
    final urlResponse = supabase.storage.from('avatars').getPublicUrl(path);
    return urlResponse;
  }

  Future<void> _saveProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    String? photoUrl;
    if (_image != null) {
      photoUrl = await _uploadImage(_image!, user.uid);
    }

    await supabase.from('profiles').upsert({
      'id': user.uid,
      'name': nameController.text,
      'surname': surnameController.text,
      'photo_url': photoUrl,
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile saved")));
  }

  Future<void> _loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final data = await supabase.from('profiles').select().eq('id', user.uid).maybeSingle();
    if (data != null) {
      nameController.text = data['name'] ?? '';
      surnameController.text = data['surname'] ?? '';
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: const CustomAppBar(title: "Profil Ekranı"),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_image != null)
              CircleAvatar(backgroundImage: FileImage(_image!), radius: 50)
            else
              const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            TextButton(onPressed: _pickImage, child: const Text("Profil fotosu seç")),
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "İsim")),
            TextField(controller: surnameController, decoration: const InputDecoration(labelText: "Soyisim")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProfile, child: const Text("Profili Güncelle")),
          ],
        ),
      ),
    );
  }
}
