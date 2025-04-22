
// main.dart dosyasında UI bileşenlerini kullanarak CRUD işlemlerini gösteren örnek:
import 'package:flutter/cupertino.dart';
// SQLite veritabanı ile etkileşim kurmak için gerekli paketler import edilir.
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'DatabaseHelper.dart';
import 'Note.dart';

class NotelarArayuz extends StatefulWidget {
  @override
  NotelarArayuzState createState() => NotelarArayuzState();
}

class NotelarArayuzState extends State<NotelarArayuz> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  Future<void> _refreshNotes() async {
    final notes = await DatabaseHelper.instance.readAllNotes();
    setState(() {
      _notes = notes;
    });
  }

  Future<void> _addNote() async {
    final newNote = Note(title: _titleController.text, content: _contentController.text);
    await DatabaseHelper.instance.createNote(newNote);
    _titleController.clear();
    _contentController.clear();
    _refreshNotes();
  }

  Future<void> _deleteNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Notlarım (SQLite)')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Başlık'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'İçerik'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addNote,
                child: Text('Not Ekle'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    final note = _notes[index];
                    return Card(
                      child: ListTile(
                        title: Text(note.title),
                        subtitle: Text(note.content),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteNote(note.id!),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
