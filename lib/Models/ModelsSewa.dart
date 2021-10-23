class ModelsSewa {
  int id;
  String sewa;
  String type;
  String nama;
  String foto;
  String checkin;
  String checkout;
  String biaya;
  String status;

  ModelsSewa({
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

  factory ModelsSewa.fromJson(Map<String, dynamic> json) {
    return ModelsSewa(
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
