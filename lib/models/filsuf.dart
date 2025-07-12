class Filsuf {
  final int id;
  final String nama;
  final String tahun;
  final String kata_bijak;
  final String status;

  Filsuf(
      {required this.id,
      required this.nama,
      required this.tahun,
      required this.kata_bijak,
      required this.status});

  factory Filsuf.fromJson(Map<String, dynamic> json) {
    return Filsuf(
      id: json['id'],
      nama: json['nama'],
      tahun: json['tahun'],
      kata_bijak: json['kata_bijak'],
      status: json['status'],
    );
  }
}
