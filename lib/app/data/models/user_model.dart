class UserModel {
  final String idUser;
  final String namaUser;
  final String usernameUser;
  final String emailUser;
  final String teleponUser;
  final String fotoUser;
  final int poinUser;

  UserModel({
    required this.idUser,
    required this.namaUser,
    required this.usernameUser,
    required this.emailUser,
    required this.teleponUser,
    required this.fotoUser,
    required this.poinUser,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        idUser: json['id_user'],
        namaUser: json['nama_user'],
        usernameUser: json['username_user'],
        emailUser: json['email_user'],
        teleponUser: json['telepon_user'],
        fotoUser: json['foto_user'],
        poinUser: json['poin_user'],
      );

  Map<String, dynamic> toMap() => {
        'id_user': idUser,
        'nama_user': namaUser,
        'username_user': usernameUser,
        'email_user': emailUser,
        'telepon_user': teleponUser,
        'foto_user': fotoUser,
        'poin_user': poinUser,
      };
}
