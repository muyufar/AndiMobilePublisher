import 'package:flutter/material.dart';

class PengembalianProduk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara Pengembalian Produk'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),
            Text(
              'Untuk mengajukan proses pengembalian atau penukaran barang, silakan membaca dengan seksama Syarat & Ketentuan Pengembalian atau Penukaran Barang.',
            ),
            SizedBox(height: 8),
            Text(
              '1. Untuk mengajukan proses pengembalian atau penukaran barang, silakan membaca dengan seksama Syarat & Ketentuan Pengembalian atau Penukaran Barang.',
            ),
            Text(
              '2. Produk tidak boleh dalam keadaan rusak, kotor/dicorat-coret.',
            ),
            Text(
              '3. Label harga/merek barang masih dalam keadaan utuh (jika ada label harga/merek).',
            ),
            Text(
              '4. Ongkos kirim ditanggung oleh pembeli kecuali retur karena cacat.',
            ),
            Text(
              '5. Sebelum mengembalikan barang, harap konfirmasi terlebih dahulu melalui nomor WA 085729900700/08112936852.',
            ),
            Text(
              '6. Kami tidak menerima permintaan barang dikembalikan dengan alasan pelanggan tidak jadi order atau salah memilih judul buku.',
            ),
            Text(
              '7. Jika ditemukan salah barang atau sobek, silakan konfirmasikan untuk meminta retur.',
            ),
            Text(
              '8. Refund Dana barang reject hanya diberikan jika stok sudah habis, jika stok masih ada akan ditukar dengan barang yang sama.',
            ),
            Text(
              '9. Permintaan retur diterima maksimal 3 hari setelah barang sampai (berdasarkan data online di ekspedisi yang dipilih saat proses order).',
            ),
            SizedBox(height: 8),
            Text(
              'Alamat Retur Barang:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Penerbit & Percetakan Andi Yogyakarta (Tim AndiPublisher)'),
            Text(
              'Jl Beo 38-40, Demangan Baru, Caturtunggal,',
            ),
            Text('Depok, Sleman, D.I Yogyakarta 55281'),
            Text('Telp 0274-561881 ext 204, HP/WA 085729900700/08112936852'),
            SizedBox(height: 8),
            Text(
              'Untuk retur barang, silakan hubungi kami:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Tim AndiPublisher'),
            Text('085729900700/08112936852'),
            Text('andipublishercom@yahoo.com'),
          ],
        ),
      ),
    );
  }
}
