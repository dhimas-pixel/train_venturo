import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  User({
    this.idUser,
    this.email,
    this.nama,
    this.pin,
    this.foto,
    this.mRolesId,
    this.isGoogle,
    this.isCustomer,
    this.roles,
    this.token,
  });

  @HiveField(0)
  int? idUser;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? nama;

  @HiveField(3)
  String? pin;

  @HiveField(4)
  String? foto;

  @HiveField(5)
  int? mRolesId;

  @HiveField(6)
  int? isGoogle;

  @HiveField(7)
  int? isCustomer;

  @HiveField(8)
  String? roles;

  @HiveField(9)
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        email: json["email"],
        nama: json["nama"],
        pin: json["pin"],
        foto: json["foto"],
        mRolesId: json["m_roles_id"],
        isGoogle: json["is_google"],
        isCustomer: json["is_customer"],
        roles: json["roles"],
        token: json["akses"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "email": email,
        "nama": nama,
        "pin": pin,
        "foto": foto,
        "m_roles_id": mRolesId,
        "is_google": isGoogle,
        "is_customer": isCustomer,
        "roles": roles,
        "token": token,
      };
}
