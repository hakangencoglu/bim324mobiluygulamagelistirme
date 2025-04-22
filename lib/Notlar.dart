/*import 'package:flutter/material.dart';
import 'Note.dart';
import 'DatabaseHelper.dart';

class Notlar extends StatefulWidget {
  @override
  NotlarState createState() => NotlarState();
}

class NotlarState extends State<Notlar> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  List<Note> _notes = [];
  Note? _editingNote; // Güncellenen not varsa onu tutar

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

  Future<void> _saveNote() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    if (title.isEmpty || content.isEmpty) return;

    if (_editingNote == null) {
      // Yeni not ekleme
      await DatabaseHelper.instance.createNote(
        Note(title: title, content: content),
      );
    } else {
      // Mevcut notu güncelleme
      await DatabaseHelper.instance.updateNote(
        Note(id: _editingNote!.id, title: title, content: content),
      );
    }

    _titleController.clear();
    _contentController.clear();
    _editingNote = null;
    _refreshNotes();
  }

  void _startEdit(Note note) {
    setState(() {
      _editingNote = note;
      _titleController.text = note.title;
      _contentController.text = note.content;
    });
  }

  Future<void> _deleteNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveNote,
                    child: Text(_editingNote == null ? 'Not Ekle' : 'Güncelle'),
                  ),
                ),
                if (_editingNote != null)
                  SizedBox(width: 10),
                if (_editingNote != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      setState(() {
                        _editingNote = null;
                        _titleController.clear();
                        _contentController.clear();
                      });
                    },
                    child: Text('İptal'),
                  ),
              ],
            ),
            Divider(height: 30),
            Expanded(
              child: _notes.isEmpty
                  ? Center(child: Text('Henüz not eklenmedi'))
                  : ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  final note = _notes[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.orange),
                            onPressed: () => _startEdit(note),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteNote(note.id!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/