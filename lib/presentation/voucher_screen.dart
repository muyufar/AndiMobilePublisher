import 'package:andipublisher/app/data/models/data_ebook_checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:andipublisher/app/data/models/voucher_model.dart';
import 'package:andipublisher/app/data/services/voucher_service.dart';
import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:get/get.dart';

class VoucherScreen extends StatefulWidget {
  @override
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  // Variabel untuk menyimpan data voucher
  VoucherEbook? voucherEbook;

  // Variabel untuk mengontrol input code
  final TextEditingController codeController = TextEditingController();

  // Fungsi untuk mengambil data voucher dari layanan
  Future<void> fetchVoucherData() async {
    final String code = codeController.text;

    // Dapatkan data checkout ebook dari argumen navigasi
    final CheckoutEbookModel checkoutEbookModel =
        Get.arguments as CheckoutEbookModel;

    // Ambil idEbook dan idUser dari data checkout ebook
    final int idEbook = checkoutEbookModel.dataUser as int;
    final int idUser = checkoutEbookModel.dataEbookCheckout as int;

    final Voucher? result =
        await VoucherService.claimVoucher(code, idEbook, idUser);

    setState(() {
      voucherEbook = voucherEbook;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field untuk code
            TextField(
              controller: codeController,
              decoration: InputDecoration(labelText: 'Code Voucher'),
            ),
            ElevatedButton(
              onPressed: fetchVoucherData,
              child: Text('Klaim Voucher'),
            ),
            // Menampilkan hasil voucher
            if (voucherEbook != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID Voucher: ${voucherEbook!.isVoucher}'),
                      Text('Nama Voucher: ${voucherEbook!.name}'),
                      Text('Diskon Persen: ${voucherEbook!.beli.persen}%'),
                      Text('Diskon Nominal: Rp ${voucherEbook!.beli.harga}'),
                      Text(
                          'Minimum Transaksi: Rp ${voucherEbook!.minimalTransaction}'),
                      // Tambahkan informasi lain yang Anda inginkan
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
