class PromoResModel {
  int? statusCode;
  List<Data>? data;

  PromoResModel({this.statusCode, this.data});

  PromoResModel.fromJson(Map<String, dynamic> json) {
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
  int? idPromo;
  String? nama;
  String? type;
  int? diskon;
  int? nominal;
  int? kadaluarsa;
  String? syaratKetentuan;
  String? foto;
  int? createdAt;
  int? createdBy;
  int? isDeleted;

  Data(
      {this.idPromo,
      this.nama,
      this.type,
      this.diskon,
      this.nominal,
      this.kadaluarsa,
      this.syaratKetentuan,
      this.foto,
      this.createdAt,
      this.createdBy,
      this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    idPromo = json['id_promo'];
    nama = json['nama'];
    type = json['type'];
    diskon = json['diskon'];
    nominal = json['nominal'];
    kadaluarsa = json['kadaluarsa'];
    syaratKetentuan = json['syarat_ketentuan'];
    foto = json['foto'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_promo'] = idPromo;
    data['nama'] = nama;
    data['type'] = type;
    data['diskon'] = diskon;
    data['nominal'] = nominal;
    data['kadaluarsa'] = kadaluarsa;
    data['syarat_ketentuan'] = syaratKetentuan;
    data['foto'] = foto;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['is_deleted'] = isDeleted;
    return data;
  }
}
