class OrderReqModel {
  Order? order;
  List<Menu>? menu;

  OrderReqModel({this.order, this.menu});

  // OrderReqModel.fromJson(Map<String, dynamic> json) {
  //   order = json['order'] != null ? Order.fromJson(json['order']) : null;
  //   if (json['menu'] != null) {
  //     menu = <Menu>[];
  //     json['menu'].forEach((v) {
  //       menu!.add(Menu.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (order != null) {
  //     data['order'] = order!.toJson();
  //   }
  //   if (menu != null) {
  //     data['menu'] = menu!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Order {
  int? idUser;
  int? idVoucher;
  int? potongan;
  int? totalBayar;

  Order({this.idUser, this.idVoucher, this.potongan, this.totalBayar});

  // Order.fromJson(Map<String, dynamic> json) {
  //   idUser = json['id_user'];
  //   idVoucher = json['id_voucher'];
  //   potongan = json['potongan'];
  //   totalBayar = json['total_bayar'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id_user'] = idUser;
  //   data['id_voucher'] = idVoucher;
  //   data['potongan'] = potongan;
  //   data['total_bayar'] = totalBayar;
  //   return data;
  // }
}

class Menu {
  int? idMenu;
  int? harga;
  int? level;
  List<int>? topping;
  int jumlah;

  Menu({
    this.idMenu,
    this.harga,
    this.level,
    this.topping,
    this.jumlah = 1,
  });

  // Menu.fromJson(Map<String, dynamic> json) {
  //   idMenu = json['id_menu'];
  //   harga = json['harga'];
  //   level = json['level'];
  //   topping = json['topping'].cast<int>();
  //   jumlah = 1;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id_menu'] = idMenu;
  //   data['harga'] = harga;
  //   data['level'] = level;
  //   data['topping'] = topping;
  //   data['jumlah'] = jumlah;
  //   return data;
  // }

  void toggleDone() {
    jumlah++;
  }

  void decreaseDown() {
    jumlah == 0 ? 0 : jumlah--;
  }
}
