class LoginResModel {
  int? statusCode;
  Data? data;

  LoginResModel({this.statusCode, this.data});

  LoginResModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? idUser;
  String? email;
  String? nama;
  String? pin;
  String? foto;
  int? mRolesId;
  int? isGoogle;
  int? isCustomer;
  String? roles;
  Akses? akses;

  User(
      {this.idUser,
      this.email,
      this.nama,
      this.pin,
      this.foto,
      this.mRolesId,
      this.isGoogle,
      this.isCustomer,
      this.roles,
      this.akses});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    email = json['email'];
    nama = json['nama'];
    pin = json['pin'];
    foto = json['foto'];
    mRolesId = json['m_roles_id'];
    isGoogle = json['is_google'];
    isCustomer = json['is_customer'];
    roles = json['roles'];
    akses = json['akses'] != null ? Akses.fromJson(json['akses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['email'] = email;
    data['nama'] = nama;
    data['pin'] = pin;
    data['foto'] = foto;
    data['m_roles_id'] = mRolesId;
    data['is_google'] = isGoogle;
    data['is_customer'] = isCustomer;
    data['roles'] = roles;
    if (akses != null) {
      data['akses'] = akses!.toJson();
    }
    return data;
  }
}

class Akses {
  bool? authUser;
  bool? authAkses;
  bool? settingMenu;
  bool? settingCustomer;
  bool? settingPromo;
  bool? settingDiskon;
  bool? settingVoucher;
  bool? laporanMenu;
  bool? laporanCustomer;

  Akses(
      {this.authUser,
      this.authAkses,
      this.settingMenu,
      this.settingCustomer,
      this.settingPromo,
      this.settingDiskon,
      this.settingVoucher,
      this.laporanMenu,
      this.laporanCustomer});

  Akses.fromJson(Map<String, dynamic> json) {
    authUser = json['auth_user'];
    authAkses = json['auth_akses'];
    settingMenu = json['setting_menu'];
    settingCustomer = json['setting_customer'];
    settingPromo = json['setting_promo'];
    settingDiskon = json['setting_diskon'];
    settingVoucher = json['setting_voucher'];
    laporanMenu = json['laporan_menu'];
    laporanCustomer = json['laporan_customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth_user'] = authUser;
    data['auth_akses'] = authAkses;
    data['setting_menu'] = settingMenu;
    data['setting_customer'] = settingCustomer;
    data['setting_promo'] = settingPromo;
    data['setting_diskon'] = settingDiskon;
    data['setting_voucher'] = settingVoucher;
    data['laporan_menu'] = laporanMenu;
    data['laporan_customer'] = laporanCustomer;
    return data;
  }
}
