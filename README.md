# Tugas 7
1. Widget tree adalah blueprint UI aplikasi, yang mewakili semua widget yang disusun. Sebuah widget induk, seperti Column, berisi satu atau lebih widget anak, seperti Text atau Icon. Hubungan induk-anak ini memberi tahu Flutter cara menyusun dan menampilkan tata letak di layar.

2. Proyek ini menggunakan Scaffold untuk struktur halaman utama dan AppBar untuk bar atas. Column, Row, dan Center digunakan untuk memposisikan konten, sementara GridView mengatur tombol-tombol. ItemCard menggunakan InkWell untuk efek ketukan dan Material untuk warna, yang berisi widget Icon dan Text untuk menampilkan konten tombol.

3. Widget MaterialApp membungkus aplikasi dan menyediakan serangkaian fitur penting yang diperlukan untuk aplikasi Material Design. Ini digunakan sebagai root widget karena mengatur layanan tingkat aplikasi seperti navigasi, menerapkan tema global, dan mendefinisikan "home" atau halaman utama aplikasi.

4. StatelessWidget bersifat immutable, artinya properti dan tampilannya tidak dapat berubah setelah dibuat. StatefulWidget bersifat dinamis dan dapat mengubah tampilannya berkali-kali selama siklus hidupnya dengan memanggil setState(). Sebaiknya menggunakan StatelessWidget untuk konten statis dan StatefulWidget untuk apa pun yang perlu diubah berdasarkan interaksi pengguna atau data.

5. BuildContext adalah sebuah objek yang berisi info posisi di dalam widget tree. Ini penting karena memungkinkan widget untuk menemukan dan berinteraksi dengan widget induknya, seperti mengambil tema aplikasi (Theme.of(context)) atau menampilkan snackbar (ScaffoldMessenger.of(context)). Dalam metode build, context dipass argumen, memberikan widget informasi yang dibutuhkannya untuk ditampilkan.

6. Hot Reload adalah fitur sangat cepat yang menyuntikkan perubahan kode baru langsung ke aplikasi yang sedang berjalan tanpa memulainya ulang, memungkinkan melihat perubahan UI secara instan sambil mempertahankan state aplikasi saat ini (seperti data dalam formulir). Hot Restart lebih lambat karena membangun ulang seluruh widget tree aplikasi dari awal, tetapi masih lebih cepat daripada menghentikan dan menjalankan ulang sepenuhnya. Proses ini mengatur ulang state aplikasi ke nilai awalnya.

# Tugas 8
### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() menumpuk halaman baru di atas halaman yang sekarang, jadi pengguna dapat kembali ke halaman sebelumnya dengan tombol back. Navigator.pushReplacement() mengganti halaman yang sekarang dengan halaman baru, akibatnya tidak dapat kembali ke halaman yang sebelumnya itu. Navigator.push() cocok digunakan pada button di halaman home misalkan untuk berpindah halaman dengan adanya opsi untuk balik ke home. Navigator.pushReplacement() cocok digunakan dalam hal seperti form agar tidak bisa balik ke form yang baru di submit.

### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Setiap layar dibangun dengan Scaffold sebagai kerangka utama dan memuat widget lain seperti AppBar dan Drawer. Appbar dipakai untuk judul page dan background color. Drawer digunakan dengan LeftDrawer agar dapat digunakan pada berbagai halaman dan digunakan sebagai navigator pada aplikasi untuk akses yang cepat ke halaman lain. 


### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Padding memberi ruang di setiap field sehingga label, input, dan error tidak berdempetan. SingleChildScrollView digunakan agar jika kontennya terlalu banyak, dapat diadakan scroll bar untuk ngescsroll seperti pada form agar keyboard tidak menjadi hambatan, dan biar bisa menampilkan konten yang besar. ListView digunakan pada drawer untuk menampilkan child widget secara berulang kali seperti pada halnya ListTitle.


### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Saya menggunakan warna yang konsisten/adjacent agar dapat memiliki satu identitas yang menyatu secara konsisten pada Absolute Ballin.