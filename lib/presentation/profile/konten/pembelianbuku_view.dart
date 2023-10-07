import 'package:flutter/material.dart';

class CaraPembelianView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara Pembelian Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                'Untuk dapat memesan buku kami, anda harus login sebagai member kami. Sebelum anda melakukan login, terlebih dahulu anda harus registrasi data diri terlebih dahulu menjadi member kami, dengan cara klik tulisan "Registrasi" pada pojok kanan atas halaman website kami.',
              ),
              Text(
                'Kemudian akan tampil halaman untuk isi data diri lengkap sampai isi email dan password. Email dan password tersebut harus diingat dan digunakan untuk login.',
              ),
              SizedBox(height: 16),
              Text(
                'Cara Memulai Pemilihan Buku',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Silahkan klik tulisan "login" pada pojok kanan atas halaman website kami. Kemudian akan tampil halaman untuk isi Email dan password.',
              ),
              Text(
                'Setelah login, silahkan anda memilih buku-buku yang hendak dipesan dengan klik tulisan "Tambah ke keranjang" yang ada disamping setiap gambar buku, maka semua buku yang dipesan akan masuk dalam keranjang belanja, dapat dilihat dengan klik gambar "keranjang" pada pojok kanan atas halaman website kami. Setelah diklik akan tampil halaman yang melampirkan semua buku pesanan anda.',
              ),
              Text(
                'Jika sudah sesuai dan cukup dalam memilih bukunya, silahkan klik tombol "Check Out" pada halaman tersebut, maka akan tampil halaman yang meminta memilih tujuan pengiriman buku dan jasa pengiriman yang diinginkan. Jika semua lengkap diisi, maka total biaya buku dan ongkos kirimnya akan muncul, Kemudian anda bisa klik "Bayar Sekarang" maka data pesanan anda akan terkirim ke sistem kami.',
              ),
              Text(
                'Setelah itu, anda dapat langsung transfer total biaya tersebut ke rekening kami, setelah anda melakukan pembayaran, status pembayaran akan otomatis terupdate oleh sistem. Dan pesanan anda akan segera kami kirim.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
