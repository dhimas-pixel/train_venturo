class VoucherResModel {
  int? statusCode;
  List<Data>? data;

  VoucherResModel({this.statusCode, this.data});

  VoucherResModel.fromJson(Map<String, dynamic> json) {
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
  int? idVoucher;
  String? nama;
  int? idUser;
  String? namaUser;
  int? nominal;
  String? infoVoucher;
  String? periodeMulai;
  String? periodeSelesai;
  int? type;
  int? status;
  String? catatan;
  bool? isSelected;

  Data({
    this.idVoucher,
    this.nama,
    this.idUser,
    this.namaUser,
    this.nominal,
    this.infoVoucher,
    this.periodeMulai,
    this.periodeSelesai,
    this.type,
    this.status,
    this.catatan,
    this.isSelected = false,
  });

  Data.fromJson(Map<String, dynamic> json) {
    idVoucher = json['id_voucher'];
    nama = json['nama'];
    idUser = json['id_user'];
    namaUser = json['nama_user'];
    nominal = json['nominal'];
    infoVoucher = json['info_voucher'];
    periodeMulai = json['periode_mulai'];
    periodeSelesai = json['periode_selesai'];
    type = json['type'];
    status = json['status'];
    catatan = json['catatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_voucher'] = idVoucher;
    data['nama'] = nama;
    data['id_user'] = idUser;
    data['nama_user'] = namaUser;
    data['nominal'] = nominal;
    data['info_voucher'] = infoVoucher;
    data['periode_mulai'] = periodeMulai;
    data['periode_selesai'] = periodeSelesai;
    data['type'] = type;
    data['status'] = status;
    data['catatan'] = catatan;
    return data;
  }
}
