class ModelsTransport {
  int id;
  int type;
  String nama;
  String merek;
  String foto;
  String norangka;
  String warna;
  String ukuran;
  String idGps;
  bool status;

  ModelsTransport(
      {this.id,
      this.type,
      this.nama,
      this.merek,
      this.foto,
      this.norangka,
      this.warna,
      this.ukuran,
      this.idGps,
      this.status});

  factory ModelsTransport.fromJson(Map<String, dynamic> json) {
    return ModelsTransport(
      id: json['id'] == null ? 'kosong' : json['id'],
      type: json['type'] == null ? 'kosong' : json['type'],
      merek: json['merek'] == null ? 'kosong' : json['merek'],
      nama: json['nama'] == null ? 'kosong' : json['nama'],
      foto: json['foto'] == null ? 'kosong' : json['foto'],
      norangka: json['norangka'] == null ? 'kosong' : json['norangka'],
      warna: json['warna'] == null ? 'kosong' : json['warna'],
      ukuran: json['ukuran'] == null ? 'kosong' : json['ukuran'],
      idGps: json['idgps'] == null ? 'kosong' : json['idgps'],
      status: json['status'] == null ? 'kosong' : json['status'],
    );
  }
}
