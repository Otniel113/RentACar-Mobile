class MobilKecil {
  final int id;
  final String nama_mobil;
  final String no_polisi;
  final String driver;
  final String ketersediaan;
  final String created_at;
  final String updated_at;

  const MobilKecil({
    required this.id,
    required this.nama_mobil,
    required this.no_polisi,
    required this.driver,
    required this.ketersediaan,
    required this.created_at,
    required this.updated_at,
  });

  factory MobilKecil.fromJson(Map<String, dynamic> json) {
    return MobilKecil(
      id: json['id'],
      nama_mobil: json['nama_mobil'],
      no_polisi: json['no_polisi'],
      driver: json['driver'],
      ketersediaan: json['ketersediaan'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}