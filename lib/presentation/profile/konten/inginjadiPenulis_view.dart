import 'package:flutter/material.dart';

class InginJadiPenulis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingin Jadi Penulis?'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prosedur Penulisan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Hubungan Antara Penulis dan Penerbit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Penulis dengan Penerbit memiliki kedudukan setara; secara umum Penulis memandang Penerbit bertindak sebagai intermediary karya-karya yang akan disampaikan kepada masyarakat, sedangkan Penerbit memandang Penulis sebagai aset penting perusahaan yang menyebabkan proses penerbitan tetap berlangsung.',
            ),
            SizedBox(height: 16),
            Text(
              'Kepentingan Penulis dalam Menulis',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Kepentingan apa di balik dorongan untuk menulis? Menulis dapat meningkatkan kredit point (bagi pengajar), meningkatkan kredibilitas, dan pemenuhan finansial. Hal tersebut yang memotivasi penulis untuk menghasilkan suatu karya yang berkualitas.',
            ),
            SizedBox(height: 16),
            Text(
              'Kelebihan Penerbit ANDI',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Apa kelebihan Penerbit ANDI dibanding penerbit lain?',
            ),
            Text(
              '1. Buku ANDI telah memiliki Brand Name tersendiri di hati masyarakat.',
            ),
            Text(
              '2. Memiliki jaringan distribusi yang luas.',
            ),
            Text(
              '3. Memiliki mesin cetak sendiri sehingga hasil, kecepatan, dan kualitas dapat diatur dengan baik.',
            ),
            Text(
              '4. Memiliki sistem royalti yang jelas, jujur, dan dapat dipertanggungjawabkan.',
            ),
            SizedBox(height: 16),
            Text(
              'Sinergi Kerja Sama Antara Penulis dan Penerbit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Dengan sinergi kerja sama antara Penulis dengan Penerbit akan diperoleh hasil berupa penerimaan masyarakat terhadap buku terbitan ANDI.',
            ),
            SizedBox(height: 16),
            Text(
              'Bentuk Royalti Penerbit ANDI',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Penerbit ANDI memberikan royalti sebagai berikut:',
            ),
            Text(
              'Besar royalti standar adalah 10%, dengan perhitungan: 10% x harga jual x oplah (potong pajak).',
            ),
            Text(
              'Mengingat Penerbit ANDI memiliki bentuk kerja sama yang beragam pada saluran distribusi pemasaran, maka perhitungan royalti adalah berdasarkan buku yang benar-benar telah terbayar lunas, dengan demikian buku yang sifatnya konsinyasi atau kredit belum dianggap sebagai buku laku. Dalam hal ini Penerbit ANDI akan selalu menjaga kejujuran dan kepercayaan bagi semua relasinya, ini semua karena nama baik sangat penting bagi Penerbit ANDI.',
            ),
            SizedBox(height: 16),
            Text(
              'Bentuk Kerja Sama Penerbitan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Bentuk kerja sama penerbitan yang ditawarkan Penerbit ANDI mencakup:',
            ),
            Text(
              '1. Kerja sama Penerbit dengan Penulis; yaitu kerja sama antara Penerbit dengan Penulis secara individu untuk menerbitkan sebuah buku.',
            ),
            Text(
              '2. Kerja Sama Penerbit dengan Kelompok Penulis; yaitu kerja sama antara Penerbit dengan beberapa Penulis sekaligus untuk menerbitkan sebuah buku. Dalam kerja sama ini, Penulis wajib menunjuk satu orang dengan pemberian surat kuasa, untuk bertanggung jawab terhadap segala urusan administratif maupun non-administratif yang berkaitan dengan penerbitan.',
            ),
            Text(
              '3. Kerja sama Penerbit dengan Lembaga; yaitu kerja sama antar Penerbit dengan sekelompok Penulis yang telah dikoordinasi oleh Lembaga/Institusi untuk menerbitkan sebuah buku. Dalam hal ini Penerbit hanya berhubungan dengan Lembaga/Institusi yang telah diberi kepercayaan oleh Penulis.',
            ),
            SizedBox(height: 16),
            Text(
              'Kerja Sama Umum',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Kerja sama cetak. Penerbit hanya membantu dalam jasa percetakannya, seperti buku jurnal ilmiah dan sebagainya. Kerja sama cetak dan penerbitan, Penerbit bekerja sama dengan Perorangan/Lembaga untuk menerbitkan sebuah buku dengan tanggungan biaya penerbitan bersama.',
            ),
            SizedBox(height: 16),
            Text(
              'Materi yang Harus Dikirim',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Penulis harus mengirimkan ke Penerbit naskah final, bukan outline atau draft, yang disertai:',
            ),
            Text('- Kata Pengantar'),
            Text('- Daftar Isi'),
            Text('- Daftar Gambar'),
            Text('- Daftar Tabel'),
            Text('- Daftar Lampiran'),
            Text('- Isi'),
            Text('- Daftar Pustaka'),
            Text('- Indeks'),
            Text('- Abstrak (sinopsis)'),
            Text('- Penjelasan perihal: pasar sasaran yang dituju, prospek pasar, manfaat buku ybs'),
            Text('- Profil penulis, memberi keterangan singkat tentang penulis.'),
            SizedBox(height: 16),
            Text(
              'Penilaian Naskah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Penerbit menilai naskah dari berbagai aspek:',
            ),
            Text('1. Aspek Ideologis'),
            Text('2. Aspek Keilmuan'),
            Text('3. Aspek Penyajian'),
            Text('4. Aspek Pemasaran'),
            Text('5. Aspek Reputasi Penulis'),
            SizedBox(height: 16),
            Text(
              'Keputusan Menerima/Menolak Naskah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Untuk Apa dan Mengapa Penerbit Harus Menilai Naskah? Penerbit adalah suatu badan usaha yang bercita-cita mencerdaskan kehidupan bangsa. Untuk tujuan tersebut Penerbit mengusahakan, menyediakan, dan menyebarluaskan bagi khalayak umum, pengetahuan dan pengalaman hasil karya ilmiah para Penulis dalam bentuk sajian yang terpadu, rapi, indah, dan komunikatif, baik isi maupun kemasan fisik, melalui tata cara yang sesuai, dan bertanggung jawab atas segala risiko yang ditimbulkan oleh kegiatannya. Berdasarkan pengertian mengenai penerbitan tersebut, dapat disimpulkan bahwa penerbit tidak bermaksud untuk menghakimi hasil karya Penulis, sehingga tidak ada alasan untuk tidak menghargai karya tersebut karena Penulis adalah “rekan sejawat” bagi Penerbit.',
            ),
            Text(
              'Penilaian naskah bukan untuk menjatuhkan vonis naskah baik atau buruk, layak terbit atau tidak. Langkah tersebut digunakan sebagai sarana untuk memperlancar proses penerbitan secara optimal.',
            ),
            SizedBox(height: 16),
            Text(
              'Proses penilaian ini adalah proses standar penerbitan sehingga perlu ada komunikasi yang baik antara Penerbit dan Penulis. Dengan demikian tidak ada salah-pengertian bahwa Penerbit menganggap remeh Penulis atau Penulis merasa naskahnya sudah yang terbaik.',
            ),
            SizedBox(height: 16),
            Text(
              'Keputusan Naskah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Setelah Penulis menyerahkan naskah, Penerbit memberikan keputusan melalui surat resmi kepada Penulis, apakah buku diterbitkan atau tidak. Untuk naskah yang diterima, Penerbit akan mengirim surat pemberitahuan resmi. Penulis wajib melengkapi kelengkapan naskah - softcopy. Untuk naskah yang ditolak, naskah akan dikembalikan kepada Penulis bersama dengan surat pemberitahuan penolakan penerbitan.',
            ),
            SizedBox(height: 16),
            Text(
              'Pengiriman Softcopy: CD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'CD Softcopy naskah dikirim dapat dengan cara:',
            ),
            Text('- Lewat pos/paket ditujukan ke:'),
            Text('  Penerbit ANDI'),
            Text('  Jl. Beo 38-40 Yogyakarta 55281'),
            Text('  Telp (0274) 561881'),
            Text('- Datang langsung ke kantor Penerbit ANDI dan menemui bagian penerbitan ANDI.'),
            Text('- Lewat email (Maksimal 1 Mb per kiriman):'),
            Text('  naskahbukuandi@gmail.com; naskahandi@gmail.com; andipenerbitan@gmail.com;'),
            Text('  naskahgarammedia@gmail.com; naskahfiksiandi@gmail.com'),
            SizedBox(height: 16),
            Text(
              'Format Naskah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1. Format Naskah Siap Cetak',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Format pengaturan naskah dapat menggunakan Template yang disediakan oleh Penerbit Andi. Format ini merupakan Template standar yang dapat disesuaikan dengan naskah yang sedang ditulis. Anda dapat meminta Template tersebut melalui e-mail, atau datang langsung ke Penerbit ANDI. Format naskah standar siap cetak, adalah sebagai berikut:',
            ),
            Text('Jenis huruf untuk teks isi: Bookman Old Style, New Century School Book atau Times New Roman 10/11 point.'),
            Text('Judul bab (Heading 1): font sama dengan teks isi, ukurannya diatur sedemikian rupa agar tampak menonjol dan serasi dengan ukuran 20 pt.'),
            Text('Judul sub-bab (Heading 2): font sama dengan teks, 18 point, capital, bold.'),
            Text('Judul sub-sub-bab (Heading 3): font sama dengan teks, 10 point, capital underline'),
            Text('Header dan Footer: menggunakan font yang berbeda, dapat divariasikan dalam style huruf bold atau italic.'),
            Text('Footnote: Font sama, 8 point; dapat menggunakan font lain yang serasi.'),
            Text('Alignment: Justified'),
            Text('Spacing: Before – 0, After – 0,6'),
            Text('Line Spacing: Single'),
            Text('Gambar-gambar tangkapan (capture) layar sebaiknya menggunakan format jpg. Gambar sebaiknya dikirimkan dalam file tersendiri yang di kumpulkan dalam sebuah folder gambar dan dilakukan link terhadap naskah.'),
            SizedBox(height: 16),
            Text(
              'Contoh Penomoran Halaman:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Halaman judul: i'),
            Text('Halaman Copyright: ii'),
            Text('Halaman Persembahan: iii'),
            Text('Kata Pengantar: v'),
            Text('Daftar Isi: vii'),
            Text('Halaman Isi'),
            Text('Pendahuluan (Bab I): 1'),
            Text('Bab II: 3, 5, 7, 9, dst. (selalu halaman ganjil).'),
            SizedBox(height: 16),
            Text(
              'Ukuran Buku dan Area Cetak',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Setelah Anda menentukan sistematika penulisan buku Anda, hal penting berikutnya adalah format buku yang akan Anda tulis. Format buku terdiri dari beberapa ukuran yaitu ukuran besar, standar, kecil, atau buku saku serta format spesial. Penentuan format ini akan berpengaruh terhadap ketebalan buku dan kedalaman materi yang Anda inginkan.'),
            Text('Format buku di Penerbit Andi:'),
            Text('Format Besar: 20 cm x 28 cm, 21,5 cm x 15,5 cm'),
            Text('Format Standar: 16 cm x 23 cm, 11,5 cm x 17,5 cm'),
            Text('Format Kecil: 14 cm x 21 cm, 10 cm x 16 cm'),
            Text('Buku Saku: 10 cm x 18 cm, 13,5 cm x 7,5 cm'),
            SizedBox(height: 16),
            Text(
              '2. Format Khusus',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Banyak Penulis tidak memperhatikan format ini sehingga saat dilakukan pengaturan layout dan setting, beberapa bagian buku menjadi tidak sesuai dengan maksud Penulis. Ketidaksesuaian tersebut contohnya: proporsi gambar yang tidak benar, pemotongan kata yang tidak tepat (terutama pada listing program pada buku pemrograman), dan ketebalan buku yang tidak proporsional.',
            ),
            SizedBox(height: 16),
            Text(
              'Catatan: Prosedur penerbitan ini sewaktu-waktu dapat berubah mengikuti perkembangan, situasi dan kondisi, untuk itu diharapkan Penulis dapat mengikuti informasi terbaru di Penerbit Andi.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'NPWP PENULIS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'No NPWP, Kena Lebih Tinggi',
            ),
            Text(
              'Kabar untuk para Penulis mengenai kebijakan Pemerintah yang berlaku mulai tahun 2009.',
            ),
            Text(
              'Berikut ini akan dijelaskan mengenai prosedur pemungutan pajak bagi yang ber-NPWP dan yang tidak ber-NPWP:',
            ),
            Text(
              'Pemotong/pemungut pajak harus memastikan terlebih dahulu apakah Wajib Pajak yang pajaknya akan dipotong atau dipungut sudah memiliki NPWP atau belum. Mengapa? Karena tarif yang akan digunakan berbeda.',
            ),
            Text(
              'Untuk Penulis, akan diberlakukan ketentuan dari “UNDANG-UNDANG NOMOR 36 TAHUN 2008 TANGGAL 23 SEPTEMBEER 2008 – TENTANG PERUBAHAN KEEMPAT ATAS Undang-Undang Nomor 7 TAHUN 1983 TENTANG PAJAK PENGHASILAN”, yang mulai berlaku sejak Januari 2009 khususnya pasal 23 tentang royalty.',
            ),
            Text(
              'Perhatikan bunyi ketentuan yang terdapat dalam Pasal 21 ayat (5a), Pasal 22 ayat (3) dan Pasal 23 ayat (1a) UU Nomor 36 Tahun 2008.',
            ),
            Text('1. Pasal 21 ayat (5a)'),
            Text('Pasal ini menyebutkan bahwa pemotongan PPh Pasal 21 harus menerapkan tarif yang lebih tinggi 20% terhadap Wajib Pajak yang tidak memiliki Nomor Pokok Wajib Pajak (NPWP) dibanding tarif yang ditetapkan terhadap Wajib Pajak yang dapat menunjukkan Nomor Pokok Wajib Pajak.'),
            Text('2. Pasal 22 ayat (3)'),
            Text('Pasal ini menyebutkan bahwa pemotongan PPh Pasal 21 harus menerapkan tarif yang lebih tinggi 20% terhadap Wajib Pajak yang tidak memiliki Nomor Pokok Wajib Pajak (NPWP) dibanding tarif yang ditetapkan terhadap Wajib Pajak yang dapat menunjukkan Nomor Pokok Wajib Pajak.'),
            Text('3. Pasal 23 ayat (1a)'),
            Text('Pasal ini menyebutkan bahwa pemotongan PPh Pasal 21 harus menerapkan tarif yang lebih tinggi 20% terhadap Wajib Pajak yang tidak memiliki Nomor Pokok Wajib Pajak (NPWP) dibanding tarif yang ditetapkan terhadap Wajib Pajak yang dapat menunjukkan Nomor Pokok Wajib Pajak.'),
            Text('Perlu diingat bahwa pemotong pajak adalah Wajib Pajak yang dikenakan kewajiban untuk memotong dan menyetor PPh yang dipotongnya ke kas Negara.'),
            SizedBox(height: 16),
            Text(
              'Wajib Pajak yang sudah memiliki NPWP dan yang sudah menyetor pajaknya maka berhak meminta Surat Keterangan Fiskal yang nantinya harus dilampirkan kepada pemotong pajak sebagaimana dimaksud dalam Undang-Undang tersebut.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}