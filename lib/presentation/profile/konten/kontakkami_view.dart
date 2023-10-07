import 'package:flutter/material.dart';

class KontakKamiView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Kami'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Office:', Icons.location_on),
          _buildText(
            'Jl. Beo No.38-40, Mrican, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
          ),
          _buildOperatingHours('Senin – Jum’at Pukul 08.00 – 16.45'),

          _buildSectionTitle('Whatshapp:', Icons.message),
          _buildText('Admin 1 : 0857 2990 0700'),
          _buildText('Admin 2 : 0811 2936 852'),
          _buildOperatingHours('Senin – Jum’at Pukul 08.00 – 16.45'),

          _buildSectionTitle('Telephone:', Icons.phone),
          _buildText('Admin 1 : 0857 2990 0700'),
          _buildText('Admin 2 : 0811 2925 295'),
          _buildText('( 0274 ) 561 881 extension 204'),
          _buildOperatingHours('Senin – Jum’at Pukul 08.00 – 16.45'),

          _buildSectionTitle('Email:', Icons.email),
          _buildText('Andipublishercom@yahoo.com'),
          _buildOperatingHours('Senin – Jum’at Pukul 08.00 – 16.45'),

          _buildSectionTitle('Shopee:', Icons.shop),
          _buildText('penerbitandiofficial'),
          _buildText('Melayani Anda : 24 Jam (Pengiriman barang setiap hari Senin – Jum’at)'),
          _buildText('warehouse Jakarta : penerbitandijakarta1'),
          _buildText('Bandung : penerbitandibandung1'),
          _buildText('Surabaya : penerbitandisurabaya1'),
          _buildText('Makassar : penerbitandimakassar'),
          _buildText('Medan : penerbitandimedan'),

          _buildSectionTitle('Tokopedia:', Icons.shopping_bag),
          _buildText('Penerbit Andi Official Store'),
          _buildText('Melayani Anda : 24 Jam (Pengiriman barang setiap hari Senin – Jum’at)'),

          // Lanjutkan dengan bagian lainnya
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Text(text),
    );
  }

  Widget _buildOperatingHours(String hours) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        hours,
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}
