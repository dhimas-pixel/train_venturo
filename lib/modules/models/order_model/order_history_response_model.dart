import 'order_list_by_iduser_model.dart';

class OrderHistoryResModel {
  int? statusCode;
  Data? data;

  OrderHistoryResModel({this.statusCode, this.data});

  OrderHistoryResModel.fromJson(Map<String, dynamic> json) {
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
  List<Order>? listData;
  int? totalPrice;
  int? totalOrder;

  Data({this.listData, this.totalPrice, this.totalOrder});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['listData'] != null) {
      listData = <Order>[];
      json['listData'].forEach((v) {
        listData!.add(Order.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    totalOrder = json['totalOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listData != null) {
      data['listData'] = listData!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = totalPrice;
    data['totalOrder'] = totalOrder;
    return data;
  }
}
