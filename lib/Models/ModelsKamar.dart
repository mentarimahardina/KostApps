class ModelsKamar {
  int id;
  String nama;
  String harga;
  String foto;
  String kamarmandi;
  String kasur;
  String ukuran;
  bool ac;
  bool status;

  ModelsKamar(
      {this.id,
      this.nama,
      this.harga,
      this.foto,
      this.kamarmandi,
      this.kasur,
      this.ukuran,
      this.ac,
      this.status});

  factory ModelsKamar.fromJson(Map<String, dynamic> json) {
    return ModelsKamar(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      foto: json['foto'],
      kamarmandi: json['fasilitas']['kamarmandi'],
      kasur: json['fasilitas']['kasur'],
      ukuran: json['fasilitas']['ukuran'],
      ac: json['fasilitas']['AC'],
      status: json['status'],
    );
  }
}
