class Ogrenci {
  int id;  String ad;  int yas;
  Ogrenci({required this.id, required this.ad, required this.yas});
  factory Ogrenci.fromJson(Map<String, dynamic> veri) {
    return Ogrenci(
      id: veri['id'],      ad: veri['ad'],      yas: veri['yas'],
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
