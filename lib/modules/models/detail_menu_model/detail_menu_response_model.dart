class DetailMenuResModel {
  int? statusCode;
  Data? data;

  DetailMenuResModel({this.statusCode, this.data});

  DetailMenuResModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Menu? menu;
  List<Topping>? topping;
  List<Level>? level;

  Data({this.menu, this.topping, this.level});

  Data.fromJson(Map<String, dynamic> json) {
    menu = json['menu'] != null ? Menu.fromJson(json['menu']) : null;
    if (json['topping'] != null) {
      topping = <Topping>[];
      json['topping'].forEach((v) {
        topping!.add(Topping.fromJson(v));
      });
    }
    if (json['level'] != null) {
      level = <Level>[];
      json['level'].forEach((v) {
        level!.add(Level.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (menu != null) {
      data['menu'] = menu!.toJson();
    }
    if (topping != null) {
      data['topping'] = topping!.map((v) => v.toJson()).toList();
    }
    if (level != null) {
      data['level'] = level!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  int? idMenu;
  String? nama;
  String? kategori;
  int? harga;
  String? deskripsi;
  String? foto;
  int? status;

  Menu(
      {this.idMenu,
      this.nama,
      this.kategori,
      this.harga,
      this.deskripsi,
      this.foto,
      this.status});

  Menu.fromJson(Map<String, dynamic> json) {
    idMenu = json['id_menu'];
    nama = json['nama'];
    kategori = json['kategori'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    foto = json['foto'];
    status = json['status'];
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

class Topping {
  int? idDetail;
  int? idMenu;
  String? keterangan;
  String? type;
  int? harga;

  Topping({this.idDetail, this.idMenu, this.keterangan, this.type, this.harga});

  Topping.fromJson(Map<String, dynamic> json) {
    idDetail = json['id_detail'];
    idMenu = json['id_menu'];
    keterangan = json['keterangan'];
    type = json['type'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_detail'] = idDetail;
    data['id_menu'] = idMenu;
    data['keterangan'] = keterangan;
    data['type'] = type;
    data['harga'] = harga;
    return data;
  }
}

class Level {
  int? idDetail;
  int? idMenu;
  String? keterangan;
  String? type;
  int? harga;

  Level({this.idDetail, this.idMenu, this.keterangan, this.type, this.harga});

  Level.fromJson(Map<String, dynamic> json) {
    idDetail = json['id_detail'];
    idMenu = json['id_menu'];
    keterangan = json['keterangan'];
    type = json['type'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_detail'] = idDetail;
    data['id_menu'] = idMenu;
    data['keterangan'] = keterangan;
    data['type'] = type;
    data['harga'] = harga;
    return data;
  }
}
