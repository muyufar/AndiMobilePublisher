import 'package:flutter/material.dart';

class KebijakanPrivasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan dan Privasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                          SizedBox(height: 16),
              Text(
                'Pelanggan Andi Publisher yang terkasih,',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Berikut adalah beberapa informasi penting yang perlu Anda ketahui tentang kami:',
              ),
              SizedBox(height: 8),
              Text('1. Kami beroperasi setiap hari Senin hingga Jumat pukul 09.00 - 17.00 WIB dan hari Sabtu pukul 09.00 - 12.00 WIB. Diluar jam operasional tersebut, diskusi akan tetap kami layani hanya untuk seputar spesifikasi produk.'),
              SizedBox(height: 8),
              Text('2. Seluruh pesanan akan dikirimkan pada H+1.'),
              SizedBox(height: 8),
              Text('3. Untuk beberapa produk yang berdimensi besar, kami dapat menyediakan jasa ekspedisi yang bisa disesuaikan dengan lokasi dimana Anda berada. Harap melakukan konfirmasi ongkir ke alamat tujuan sebelum melakukan transaksi. Kami akan memberikan total ongkir, setelah ongkir ditransfer kepada kami silahkan Anda melakukan transaksi seperti biasa.'),
              SizedBox(height: 8),
              Text('4. Apabila ada pertanyaan atau keluhan, mohon disampaikan dengan bahasa yang sopan melalui WA di 08112834987 dan kami akan berusaha melayani Anda secepat mungkin.'),
              SizedBox(height: 16),
              Text(
                'Terima kasih atas perhatiannya,',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 8),
              Text('Semoga Sukses dan Sehat selalu.'),
            ],
          ),
        ),
      ),
    );
  }
}
