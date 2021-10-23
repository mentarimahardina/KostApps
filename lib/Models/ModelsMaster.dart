class ModelsMaster {
  int id;
  String nama;
  bool status;

  ModelsMaster({
    this.id,
    this.nama,
    this.status,
  });

  factory ModelsMaster.fromJson(Map<String, dynamic> json) {
    return ModelsMaster(
      id: json['id'],
      nama: json['nama'],
      status: json['status'],
    );
  }
}
