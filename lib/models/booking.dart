class Booking {
  final int id;
  final String id_mobil;
  final String nama_mobil;
  final String jenis_mobil;
  final String wisata;
  final String id_member;
  final String nama_member;
  final String status;
  final String created_at;
  final String updated_at;

  const Booking({
    required this.id,
    required this.id_mobil,
    required this.nama_mobil,
    required this.jenis_mobil,
    required this.wisata,
    required this.id_member,
    required this.nama_member,
    required this.status,
    required this.created_at,
    required this.updated_at,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      id_mobil: json['id_mobil'],
      nama_mobil: json['nama_mobil'],
      jenis_mobil: json['jenis_mobil'],
      wisata: json['wisata'],
      id_member: json['id_member'],
      nama_member: json['nama_member'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}