class LoginGoogleReqModel {
  String? isGoogle;
  String? nama;
  String? email;

  LoginGoogleReqModel({this.isGoogle, this.nama, this.email});

  LoginGoogleReqModel.fromJson(Map<String, dynamic> json) {
    isGoogle = json['is_google'];
    nama = json['nama'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_google'] = isGoogle;
    data['nama'] = nama;
    data['email'] = email;
    return data;
  }
}
