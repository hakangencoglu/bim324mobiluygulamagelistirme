// Note sınıfı, veritabanındaki her bir not kaydını temsil eder.
class Note {
  final int? id; // id opsiyonel çünkü oluşturulurken bilinmeyebilir.
  final String title; // Not başlığı
  final String content; // Not içeriği

  Note({this.id, required this.title, required this.content});

  // Veritabanına kaydedebilmek için nesneyi Map'e çeviriyoruz.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  // Veritabanından gelen Map'i, Note nesnesine dönüştürmek için kullanılır.
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}

