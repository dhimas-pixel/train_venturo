class LoginGoogleReqModel {
  String? nama;
  String? email;

  LoginGoogleReqModel({this.nama, this.email});

  LoginGoogleReqModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    return data;
  }
}
