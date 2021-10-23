class ModelsUser {
  int id;
  String nama;
  String nik;
  String jk;
  String tglahir;
  String asal;
  String username;
  String password;
  int type;

  ModelsUser({
    this.id,
    this.nama,
    this.nik,
    this.jk,
    this.tglahir,
    this.asal,
    this.username,
    this.password,
    this.type,
  });

  factory ModelsUser.fromJson(Map<String, dynamic> json) {
    return ModelsUser(
      id: json['id'],
      nama: json['nama'],
      nik: json['nik'],
      jk: json['jk'],
      tglahir: json['tgLahir'],
      asal: json['asal'],
      username: json['username'],
      password: json['password'],
      type: json['type']['id'],
    );
  }
}
