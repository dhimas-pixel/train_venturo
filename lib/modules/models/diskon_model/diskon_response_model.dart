class DiskonResModel {
  int? statusCode;
  List<Data>? data;

  DiskonResModel({this.statusCode, this.data});

  DiskonResModel.fromJson(Map<String, dynamic> json) {
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
  int? idDiskon;
  int? idUser;
  String? namaUser;
  String? nama;
  int? diskon;

  Data({this.idDiskon, this.idUser, this.namaUser, this.nama, this.diskon});

  Data.fromJson(Map<String, dynamic> json) {
    idDiskon = json['id_diskon'];
    idUser = json['id_user'];
    namaUser = json['nama_user'];
    nama = json['nama'];
    diskon = json['diskon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_diskon'] = idDiskon;
    data['id_user'] = idUser;
    data['nama_user'] = namaUser;
    data['nama'] = nama;
    data['diskon'] = diskon;
    return data;
  }
}
