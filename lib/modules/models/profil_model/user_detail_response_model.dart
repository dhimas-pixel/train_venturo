class UserDetailResModel {
  int? statusCode;
  Data? data;

  UserDetailResModel({this.statusCode, this.data});

  UserDetailResModel.fromJson(Map<String, dynamic> json) {
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
  int? idUser;
  String? nama;
  String? email;
  String? tglLahir;
  String? alamat;
  String? telepon;
  String? foto;
  String? ktp;
  String? pin;
  int? status;
  int? isCustomer;
  int? rolesId;
  String? roles;

  Data(
      {this.idUser,
      this.nama,
      this.email,
      this.tglLahir,
      this.alamat,
      this.telepon,
      this.foto,
      this.ktp,
      this.pin,
      this.status,
      this.isCustomer,
      this.rolesId,
      this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    nama = json['nama'];
    email = json['email'];
    tglLahir = json['tgl_lahir'];
    alamat = json['alamat'];
    telepon = json['telepon'];
    foto = json['foto'];
    ktp = json['ktp'];
    pin = json['pin'];
    status = json['status'];
    isCustomer = json['is_customer'];
    rolesId = json['roles_id'];
    roles = json['roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['nama'] = nama;
    data['email'] = email;
    data['tgl_lahir'] = tglLahir;
    data['alamat'] = alamat;
    data['telepon'] = telepon;
    data['foto'] = foto;
    data['ktp'] = ktp;
    data['pin'] = pin;
    data['status'] = status;
    data['is_customer'] = isCustomer;
    data['roles_id'] = rolesId;
    data['roles'] = roles;
    return data;
  }
}
