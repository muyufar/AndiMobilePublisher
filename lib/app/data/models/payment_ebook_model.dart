class PaymentEbookModel {
  //  final String? idtransaksiNew;
  final String idTransaksiLama;
  final DateTime tanggalTransaksi;
  final String keterangan;
  final String jenisTransaksi;
  final String iduser;
  final int subTotal;
  final int discTotal;
  final int grandTotal;
  // final String idcabang;
  final bool status;
    bool? isUseMidtrans;
  final String id;
  String token;
  String url;
   bool? voucherCode;

  PaymentEbookModel({
    //  this.idtransaksiNew,
    required this.idTransaksiLama,
    required this.tanggalTransaksi,
    required this.keterangan,
    required this.jenisTransaksi,
    required this.iduser,
    required this.subTotal,
    required this.discTotal,
    required this.grandTotal,
    // required this.idcabang,
    required this.status,
     this.isUseMidtrans,
    required this.id,
    this.token = "",
    this.url = "",
     this.voucherCode,

  });

  factory PaymentEbookModel.fromJson(Map<String, dynamic> json) =>
      PaymentEbookModel(
        // idtransaksiNew: json["idtransaksi_new"],
        idTransaksiLama: json["id_transaksi_lama"],
        tanggalTransaksi: DateTime.parse(json["tanggal_transaksi"]),
        keterangan: json["keterangan"],
        jenisTransaksi: json["jenis_transaksi"],
        iduser: json["iduser"],
        subTotal: json["sub_total"],
        discTotal: json["disc_total"],
        grandTotal: json["grand_total"],
        // idcabang: json["idcabang"],
        status: json["status"],
        isUseMidtrans: json["isUseMidtrans"],
        id: json["id"],
        token: json["token"] ?? "",
        url: json["url"] ?? "",
        voucherCode:
            json["voucher"] != null && json["voucher"]["isVoucher"] == true,
        
      );

  Map<String, dynamic> toJson() => {
        // "idtransaksi_new": idtransaksiNew,
        "id_transaksi_lama": idTransaksiLama,
        "tanggal_transaksi": tanggalTransaksi.toIso8601String(),
        "keterangan": keterangan,
        "jenis_transaksi": jenisTransaksi,
        "iduser": iduser,
        "sub_total": subTotal,
        "disc_total": discTotal,
        "grand_total": grandTotal,
        "isUseMidtrans": isUseMidtrans,
        // "idcabang": idcabang,
        "status": status,
        "id": id,
        "token": token,
        "url": url,
      };
}
