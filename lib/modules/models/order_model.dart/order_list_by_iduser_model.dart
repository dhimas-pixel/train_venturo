class OrderListByIdUserResModel {
  int? statusCode;
  List<Data>? data;

  OrderListByIdUserResModel({this.statusCode, this.data});

  OrderListByIdUserResModel.fromJson(Map<String, dynamic> json) {
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
  int? idOrder;
  String? noStruk;
  String? nama;
  int? totalBayar;
  String? tanggal;
  int? status;
  List<Menu>? menu;

  Data(
      {this.idOrder,
      this.noStruk,
      this.nama,
      this.totalBayar,
      this.tanggal,
      this.status,
      this.menu});

  Data.fromJson(Map<String, dynamic> json) {
    idOrder = json['id_order'];
    noStruk = json['no_struk'];
    nama = json['nama'];
    totalBayar = json['total_bayar'];
    tanggal = json['tanggal'];
    status = json['status'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_order'] = idOrder;
    data['no_struk'] = noStruk;
    data['nama'] = nama;
    data['total_bayar'] = totalBayar;
    data['tanggal'] = tanggal;
    data['status'] = status;
    if (menu != null) {
      data['menu'] = menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  int? idMenu;
  String? kategori;
  String? topping;
  String? nama;
  String? foto;
  int? jumlah;
  String? harga;
  int? total;
  String? catatan;

  Menu(
      {this.idMenu,
      this.kategori,
      this.topping,
      this.nama,
      this.foto,
      this.jumlah,
      this.harga,
      this.total,
      this.catatan});

  Menu.fromJson(Map<String, dynamic> json) {
    idMenu = json['id_menu'];
    kategori = json['kategori'];
    topping = json['topping'];
    nama = json['nama'];
    foto = json['foto'];
    jumlah = json['jumlah'];
    harga = json['harga'];
    total = json['total'];
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_menu'] = idMenu;
    data['kategori'] = kategori;
    data['topping'] = topping;
    data['nama'] = nama;
    data['foto'] = foto;
    data['jumlah'] = jumlah;
    data['harga'] = harga;
    data['total'] = total;
    data['catatan'] = catatan;
    return data;
  }
}
