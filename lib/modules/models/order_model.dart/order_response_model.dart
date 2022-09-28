class OrderResModel {
  int? statusCode;
  Data? data;

  OrderResModel({this.statusCode, this.data});

  OrderResModel.fromJson(Map<String, dynamic> json) {
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
  int? idOrder;
  String? noStruk;
  String? message;

  Data({this.idOrder, this.noStruk, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    idOrder = json['id_order'];
    noStruk = json['no_struk'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_order'] = idOrder;
    data['no_struk'] = noStruk;
    data['message'] = message;
    return data;
  }
}
