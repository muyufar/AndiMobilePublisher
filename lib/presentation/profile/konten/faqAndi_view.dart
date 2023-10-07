import 'package:flutter/material.dart';

class FaqAndi extends StatefulWidget {
  @override
  _FaqAndiState createState() => _FaqAndiState();
}

class _FaqAndiState extends State<FaqAndi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FaqItem(
                question:
                    "Apakah harus memiliki akun untuk membeli di AndiPublisher.com?",
                answer:
                    "Untuk sekarang, kamu perlu bikin akun untuk membeli produk-produk andipublisher.com. Jangan khawatir, caranya gampang, kok - kamu bisa daftar lewat Facebook, Google, atau lewat surel seperti biasa.",
              ),
              FaqItem(
                question:
                    "Apakah bisa memesan buku melalui AndiPublisher.com dan mengambil buku di toko?",
                answer:
                    "Saat ini, opsi tersebut belum tersedia. Tapi, dalam waktu dekat kamu bakal bisa memesan buku via andipublisher.com dan mengambilnya langsung di toko Gramedia terdekat.",
              ),
              FaqItem(
                question: "Aku tidak tahu mau baca buku apa. Ada rekomendasi?",
                answer:
                    "Ada, dong! Kamu bisa:\n1. Mengunjungi Homepage kami untuk mencari tahu buku yang sedang trending sekarang.\n2. Hubungi kami lewat chat di Facebook dan Instagram. Kami akan membantumu sebisa mungkin!\n3. Buka berbagai kanal media sosial dan blog kami. Di sana, kami sering merekomendasikan buku-buku yang menarik. Siapa tahu, kamu dapat ide buku baru yang bagus!",
              ),
              FaqItem(
                question:
                    "Buku yang aku cari tidak ada di AndiPublisher! Apakah buku itu tersedia?",
                answer:
                    "Kamu bisa menghubungi kami secara langsung melalui layanan live chat supaya kami bisa mencarikannya untukmu. Kami akan berusaha keras supaya buku yang kamu inginkan bisa tersedia lagi.",
              ),
              FaqItem(
                question: "Aku tidak tahu mau baca buku apa. Ada rekomendasi?",
                answer:
                    "Ada, dong! Kamu bisa:\n1. Mengunjungi Homepage kami untuk mencari tahu buku yang sedang trending sekarang.\n2. Hubungi kami lewat chat di Facebook dan Instagram. Kami akan membantumu sebisa mungkin!\n3. Buka berbagai kanal media sosial dan blog kami. Di sana, kami sering merekomendasikan buku-buku yang menarik. Siapa tahu, kamu dapat ide buku baru yang bagus!",
              ),
              FaqItem(
                question: "Apa itu Ebook?",
                answer:
                    "Ebook adalah buku dalam bentuk digital yang dapat dibaca melalui aplikasi Bahanaflix. Kamu bisa mengunduh aplikasinya di Google Play Store. Berikut adalah langkah-langkah untuk membuka e-book yang telah dibeli di website Andi Publisher:\n\n"
                    "1. Log in dengan menghubungkan akun Gmail yang telah terdaftar dan pastikan sesuai dengan akun Gmail saat melakukan pembelian.\n"
                    "2. Klik menu 'Library' (Koleksi) untuk mendownload e-book yang sudah dibeli.\n"
                    "3. Silahkan pilih e-book yang sudah dibeli dan selamat membaca!",
              ),
              FaqItem(
                question:
                    "Aku lupa membayar! Bagaimana cara mengulang pesanan yang sama?",
                answer:
                    "Untuk mengulang pesanan yang sama, ikuti langkah-langkah berikut:\n\n"
                    "1. Buka laman 'Pesanan Saya'.\n"
                    "2. Di bawah pesanan yang ingin kamu ulang, klik tombol 'Pesan Lagi'.\n"
                    "3. Setelah itu, kamu akan segera diarahkan ke laman konfirmasi pemesanan :)",
              ),
              FaqItem(
                question:
                    "Apa saja pilihan metode pembayaran yang bisa kupilih?",
                answer:
                    "Apapun metode pengiriman yang kamu pilih, kamu bisa memilih pembayaran lewat transfer ATM, kartu kredit, Instant Payment, dan E-Wallet. ",
              ),
              FaqItem(
                question:
                    "Pembayaran Bank Transfer (konfirmasi Otomatis) melalui apa saja?",
                answer:
                    "Anda dapat melakukan pembayaran melalui beberapa cara berikut:\n\n"
                    "Transfer Melalui ATM BCA:\n"
                    "1. Masukkan kartu ATM dan PIN BCA anda\n"
                    "2. Pilih Menu \"Transaksi Lainnya\"\n"
                    "3. Pilih \"Transfer\" kemudian pilih \"Ke rekening BCA Virtual Account\"\n"
                    "4. Masukkan kode pembayaran sebagai nomor virtual account dan pilih \"Benar\"\n"
                    "5. Periksa rincian pembayaran anda. Jika benar, pilih \"Ya\"\n"
                    "6. Pembayaran selesai\n\n"
                    "Transfer Melalui Internet Banking BCA:\n"
                    "1. Buka website KlikBCA, masukkan user ID dan PIN\n"
                    "2. Pilih Menu \"Transfer Dana\" kemudian pilih \"Transfer BCA Virtual Account\"\n"
                    "3. Masukkan kode pembayaran sebagai nomor virtual account dan pilih \"Benar\"\n"
                    "4. Masukkan respon KeyBCA anda dan pilih \"Kirim\"\n"
                    "5. Pembayaran selesai\n\n"
                    "Transfer Melalui Mobile Banking BCA:\n"
                    "1. Buka aplikasi KlikBCA, masukkan user ID dan PIN\n"
                    "2. Pilih Menu \"m-Transfer\" kemudian pilih \"BCA Virtual Account\"\n"
                    "3. Masukkan kode pembayaran sebagai nomor virtual account dan pilih \"Benar\" dan pilih \"Send\"\n"
                    "4. Periksa rincian pembayaran anda. Jika benar, pilih \"OK\"\n"
                    "5. Masukkan PIN mobile banking anda dan pilih \"OK\"\n"
                    "6. Pembayaran selesai\n\n"
                    "Transfer Melalui ATM Bank Mandiri:\n"
                    "1. Masukkan kartu ATM dan PIN Bank Mandiri anda\n"
                    "2. Pilih Menu \"Bayar/Beli\"\n"
                    "3. Pilih \"Lainnya\" kemudian pilih \"Lainnya\" lalu pilih \"Multi Payment\"\n"
                    "4. Masukkan kode perusahaan 70012 dan pilih \"Benar\"\n"
                    "5. Masukkan kode pembayaran sebagai nomor virtual account dan pilih \"Benar\"\n"
                    "6. Periksa rincian pembayaran anda. Jika benar, pilih \"Ya\"\n"
                    "7. Pembayaran selesai\n\n"
                    "Transfer Melalui Internet Banking Bank Mandiri:\n"
                    "1. Buka website Mandiri Online, masukkan username dan password\n"
                    "2. Pilih Menu \"Bayar\" lalu pilih \"Multi Payment\"\n"
                    "3. Masukkan penyedia jasa \"Midtrans\" dan pilih \"Lanjutkan\"\n"
                    "4. Masukkan kode pembayaran sebagai nomor virtual account dan pilih \"Lanjutkan\"\n"
                    "5. Periksa rincian pembayaran anda. Jika benar, pilih \"Lanjutkan\"\n"
                    "6. Masukkan PIN anda dan pilih \"Kirim\"\n"
                    "7. Pembayaran selesai\n\n"
                    "Transfer Melalui Mobile Banking Bank Mandiri:\n"
                    "1. Buka aplikasi Mandiri Online, masukkan username dan password\n"
                    "2. Pilih Menu \"Bayar\" lalu pilih \"Multi Payment\"\n"
                    "3. Masukkan penyedia jasa \"Midtrans\" dan pilih \"Lanjutkan\"\n"
                    "4. Masukkan kode pembayaran sebagai nomor virtual account dan pilih \"Lanjutkan\"\n"
                    "5. Periksa rincian pembayaran anda. Jika benar, pilih \"Lanjutkan\"\n\n"
                    "Transfer Melalui Bank Lainnya (ATM Bank Mandiri/Bersama):\n"
                    "1. Masukkan kartu ATM dan PIN anda\n"
                    "2. Pilih Menu \"Transaksi Lainnya\"\n"
                    "3. Pilih \"Transfer\" kemudian pilih \"Antar Bank Online\"\n"
                    "4. Masukkan kode Bank Permata (013) + Kode Pembayaran, lalu tekan \"Benar\"\n"
                    "5. Periksa rincian pembayaran anda. Jika benar, pilih \"Benar\"\n"
                    "6. Pembayaran selesai\n\n"
                    "Transfer Melalui Bank Lainnya (ATM Bank BCA/Prima):\n"
                    "1. Masukkan kartu ATM dan PIN anda\n"
                    "2. Pilih Menu \"Transaksi Lainnya\"\n"
                    "3. Pilih \"Transfer\" kemudian pilih \"Ke Rek Bank Lain\"\n"
                    "4. Masukkan kode Bank Permata (013) + Kode Pembayaran, lalu tekan \"Benar\"\n"
                    "5. Masukkan jumlah harga yang akan anda bayar secara lengkap (tanpa pembulatan), lalu tekan \"Benar\"\n"
                    "6. Masukkan Kode Pembayaran, lalu tekan \"Benar\"\n"
                    "7. Periksa rincian pembayaran anda. Jika benar, pilih \"Benar\"\n"
                    "8. Pembayaran selesai\n\n"
                    "Transfer Melalui Bank Lainnya (ATM Bank Permata/Alto):\n"
                    "1. Masukkan kartu ATM dan PIN anda\n"
                    "2. Pilih Menu \"Transaksi Lainnya\"\n"
                    "3. Pilih \"Pembayaran\" kemudian pilih \"Pembayaran Lainnya\"\n"
                    "4. Pilih \"Virtual Account\"\n"
                    "5. Masukkan Kode Pembayaran, lalu tekan \"Benar\"\n"
                    "6. Periksa rincian pembayaran anda. Jika benar, pilih \"Benar\"\n"
                    "7. Pembayaran selesai\n",
              ),
              FaqItem(
                question:
                    "Status pesananku \"Menunggu Pembayaran\". Maksudnya apa?",
                answer:
                    "Jika ada tulisan \"Menunggu Pembayaran\" di pesananmu, ada dua kemungkinan:\n\n"
                    "1. Kamu belum mentransfer pembayaran. Jika ini yang terjadi, kamu bisa mencari tahu bagaimana cara membayar lewat Transfer ATM dengan memencet tombol biru bertuliskan \"Kirim Bukti Pembayaran\" di bawah pesananmu.\n\n"
                    "2. Kamu sudah membayar, tapi kami belum mengkonfirmasi. Wah, maaf ya! Jadi begini: saat ini, kami harus mengkonfirmasi semua pembayaran secara manual - walau kami sedang berusaha agar seterusnya kami bisa mengkonfirmasi secara otomatis. Artinya, tim kami harus memeriksa konfirmasi pembayaran dari semua orang yang memesan, dan mengkonfirmasi pembayaran setiap jam 09.00 WIB, 13.00 WIB, dan 15.00 WIB. Jadi, jika kamu sudah membayar, coba cek lagi status pesananmu setelah jam-jam di atas.",
              ),
              FaqItem(
                  question: "Apa saja cara pengiriman yang bisa aku pilih?",
                  answer:
                      "Untuk sementara, kamu  bisa memilih opsi Pengiriman JNE, TIKI, J&T, POS dan Wahana. Kami sedang bekerja keras agar kamu bisa mendapat opsi pengiriman lain!"),
              FaqItem(
                  question: "Berapa biaya pengiriman?",
                  answer:
                      "Tergantung di mana alamatmu dan pilihan ekspedisi yang Kamu pilih. Kamu bisa mendapat perkiraan biaya pengiriman di Halaman checkout."),
              FaqItem(
                  question:
                      "Apa maksud dari pengiriman \"YES, Express Next Day Barang & ONS\"?",
                  answer:
                      "Pilihan metode pengiriman menggunakan ekspedisi dengan maksimal waktu 24 jam setelah paket pesanan kamu diterima oleh kurir."),
              FaqItem(
                  question: "Apa maksud dari pengiriman \"Economy Service\"?",
                  answer:
                      "Pilihan metode pengiriman menggunakan ekspedisi TIKI yang harganya paling murah dibanding tipe produk yang lain. Namun dengan konsekuensi, barang Kamu akan sampai jauh lebih lama. Layanan ini cocok apabila Kamu ingin menghemat pengeluaran saat mengirim barang, dan juga tidak terlalu terburu-buru untuk proses pengirimannya."),
              FaqItem(
                  question: "Kenapa pesananku belum tiba?",
                  answer:
                      "Perlu waktu beberapa hari agar pesananmu terkirim. Tapi, kamu bisa melacak pesananmu sudah sampai mana di laman Pesanan Saya. Kamu juga bisa menemukan perkiraan kapan pesananmu akan tiba. Jika pesananmu terlambat tiba atau tak kunjung tiba, langsung saja hubungi Customer Service kami melalui layanan Live Chat."),
              FaqItem(
                  question: "Pesananku sudah sampai mana?",
                  answer:
                      "Kamu bisa melacak pesananmu dengan meng-klik menu profile di akunmu, lalu klik lihat detail pesanan."),
              FaqItem(
                  question: "Kenapa pesananku dibatalkan?",
                  answer:
                      "Wah, pesananmu dibatalkan? Ada beberapa kemungkinan kenapa ini bisa terjadi:\n\n1. Kamu tidak melunasi pembayaran pesananmu dalam waktu 24 jam.\n2. Pesananmu tak dapat dikirim. Setelah menghubungi kamu untuk mengkonfirmasi, kami membatalkan pesanan secara otomatis, dan akan melakukan refund atas pembayaran yang sudah kamu lakukan.\n\nKhusus untuk kondisi (1), Kamu bisa memesan lagi seperti sebelumnya, namun jangan lupa kembali untuk melakukan pembayaran ya :)"),
              FaqItem(
                  question: "Apa maksud dari status \"Pesanan Disiapkan\"?",
                  answer:
                      "Pesanan Disiapkan berarti pesananmu sedang disiapkan untuk dikirim. Proses ini perlu waktu sekitar 1 hari - walau biasanya tidak selama itu juga, kok. Tapi, ada pengecualian. Kalau kamu memesan buku pre-order, biasanya buku akan dikirim sesuai syarat dan ketentuan pada pre-order tersebut."),
              FaqItem(
                  question: "Apa maksud dari status \"Dalam Perjalanan\"?",
                  answer:
                      "Jika status pemesananmu “Dalam Perjalanan”, siap-siap ya! Mitra logistik kami sudah menjemput pesananmu dari kami, dan kurir kami sedang menuju alamat yang kamu tulis :)"),
              FaqItem(
                  question:
                      "Apakah saya bisa mengembalikan barang yang sudah dipesan?",
                  answer:
                      "Sayangnya, sekarang kamu belum bisa mengembalikan barang yang sudah dipesan dan sudah diantarkan. Tapi, kamu bisa melaporkan ke Customer Support kami jika barang yang kamu terima rusak atau tidak sesuai pesanan. Jadi, kami bisa ganti dengan buku yang benar :) Namun apabila produk sudah diterima lebih dari 14 hari maka pergantian produk tidak dapat dilakukan."),
              FaqItem(
                  question:
                      "Apakah saya bisa melakukan refund dana perihal barang yang sudah dipesan?",
                  answer:
                      "Sayangnya, sekarang kamu belum bisa mengembalikan barang yang sudah dipesan dan sudah diantarkan. Untuk informasi lebih lanjut kamu dapat menghubungi Customer Support kami :)"),
              FaqItem(
                  question:
                      "Kami komunitas pembaca/penulis, dan kami ingin bekerja sama dengan Andi Publisher. Bagaimana caranya?",
                  answer:
                      "Kami ingin sekali bekerjasama denganmu! Sebaiknya, kamu langsung berbicara pada tim kami. Kamu bisa menghubungi kami melalui layanan live chat . Mari mengobrol!"),
              FaqItem(
                  question:
                      "Bagaimana caraku menjual buku yang aku terbitkan/aku tulis lewat Andi Publisher?",
                  answer:
                      "Kami ingin sekali bekerjasama denganmu! Sebaiknya, kamu langsung berbicara pada tim kami. Kamu bisa menghubungi kami melalui layanan live chat . Mari mengobrol!"),
              FaqItem(
                  question: "Apakah saya bisa jadi re-seller Andi Publisher?",
                  answer:
                      "Kalau kamu mau menjadi re-seller buku-buku Andi Publisher, silahkan kamu menghubungi tim Customer Support kami melalui layanan live chat :) Yuk bertumbuh bersama kami..."),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  FaqItem({
    required this.question,
    required this.answer,
  });

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              widget.question,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(widget.answer),
            ),
        ],
      ),
    );
  }
}
