class Ogrenci {
  int id;  String ad;  int yas;
  Ogrenci({required this.id, required this.ad, required this.yas});
  factory Ogrenci.fromJson(Map<String, dynamic> json) {
    return Ogrenci(
      id: json['id'],      ad: json['ad'],      yas: json['yas'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,      'ad': ad,      'yas': yas,
    };
  }
  @override
  String toString() => 'ID: $id, Ad: $ad, Yaş: $yas';
}
