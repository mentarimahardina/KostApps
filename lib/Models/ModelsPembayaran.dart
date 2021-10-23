class ModelsPembayaran {
  int id;
  String sewa;
  String type;
  String nama;
  String foto;
  String checkin;
  String checkout;
  String biaya;
  String status;

  ModelsPembayaran({
    this.id,
    this.sewa,
    this.type,
    this.nama,
    this.foto,
    this.checkin,
    this.checkout,
    this.biaya,
    this.status,
  });

  factory ModelsPembayaran.fromJson(Map<String, dynamic> json) {
    return ModelsPembayaran(
      id: json['id'],
      sewa: json['sewa'],
      type: json['type'],
      nama: json['nama'],
      foto: json['foto'],
      checkin: json['checkin'],
      checkout: json['checkout'],
      biaya: json['biaya'],
      status: json['status'],
    );
  }
}
