class ModelsType {
  int id;
  String nama;
  bool status;

  ModelsType({
    this.id,
    this.nama,
    this.status,
  });

  factory ModelsType.fromJson(Map<String, dynamic> json) {
    return ModelsType(
      id: json['id'],
      nama: json['nama'],
      status: json['status'],
    );
  }
}
