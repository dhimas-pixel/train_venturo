class MenuResModel {
  int? statusCode;
  List<Data>? data;

  MenuResModel({this.statusCode, this.data});

  MenuResModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idMenu;
  String? nama;
  String? kategori;
  int? harga;
  String? deskripsi;
  String? foto;
  int? status;
  late int jumlah;

  Data({
    this.idMenu,
    this.nama,
    this.kategori,
    this.harga,
    this.deskripsi,
    this.foto,
    this.status,
    this.jumlah = 0,
  });

  Data.fromJson(Map<String, dynamic> json) {
    idMenu = json['id_menu'];
    nama = json['nama'];
    kategori = json['kategori'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    foto = json['foto'];
    status = json['status'];
    jumlah = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_menu'] = idMenu;
    data['nama'] = nama;
    data['kategori'] = kategori;
    data['harga'] = harga;
    data['deskripsi'] = deskripsi;
    data['foto'] = foto;
    data['status'] = status;
    return data;
  }
}
