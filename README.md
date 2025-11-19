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

# Tugas 9
### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Kalau pakai model dart akan lebih mudah mengelola kodenya, dengan model dart, IDE dapat mengetahui tipe data dari model, sehingga dapat menolong anda dalam koding. Selain itu, null-safety flutter juga dapat digunakan secara full karena dapat melakukan String? dll, kalau pake django langsung gabisa. Secara maintainability, jika API ada perubahan, kita tinggal ubah pada moodel, jika langsung, harus semuanya kita 

### Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Http fungsinya untuk komunikasi dengan Restful APInya, dan CookieRequest untuk yang membutuhkan cookies seperti authentikasi. Perbedaanya adalah http bekerja secara independen dan harus melakukan semuanya sendiri. CookieRequest dari Django digunakan satu instance dan dipakai untuk backend Django seperti views session cookies, csrf, dll.

### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Karen menyimpan informasi penting dalam memory, dan semua 

### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Untuk konektivitas Flutter ke Django, kita perlu menjalankan server Django di alamat yang bisa diakses emulator atau device (misalnya localhost yang diakses sebagai 10.0.2.2 di Android emulator), menyediakan endpoint HTTP atau HTTPS yang jelas (URL base dan path API), lalu di Flutter mengarahkan semua request ke URL tersebut dengan paket seperti http atau CookieRequest sehingga setiap input atau aksi di aplikasi bisa dikirim sebagai request ke Django dan menerima respons JSON sebagai balasan.

Alasan menambahkan 10.0.2.2 ke ALLOWED_HOSTS adalah agar Django tidak menolak request dari host itu, mengaktifkan CORS dan mengatur SameSite/cookie agar browser atau WebView maupun Flutter boleh mengirim dan menerima cookie lintas origin, dan izin akses internet di Android diperlukan agar aplikasi boleh membuka koneksi jaringan, jika salah satu bagian ini keliru maka request bisa gagal total, diblokir oleh Django, cookie sesi tidak pernah terkirim, atau aplikasi Android memunculkan error jaringan sehingga fitur login dan pengambilan data tidak berjalan.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data biasanya dimulai saat pengguna mengisi form di Flutter, lalu menekan tombol submit, Flutter membaca nilai dari controller atau state, mengubahnya menjadi payload JSON atau form data dan mengirimkannya lewat HTTP ke endpoint Django, Django menerima request di view, memvalidasi dan memproses data, menyimpan atau mengambil data dari database, kemudian mengirim balik respons JSON, Flutter menerima respons itu, mengubahnya ke model Dart, menyimpan di state, lalu widget yang terkait di-rebuild sehingga data baru muncul di layar.

###  Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Untuk autentikasi, saat register pengguna mengisi data akun di Flutter, aplikasi mengirim POST ke endpoint register Django, Django memvalidasi dan membuat user baru lalu mengirim respons sukses dan Flutter bisa menampilkan pesan atau langsung mengarah ke halaman login, pada login Flutter mengirim username dan password ke endpoint login, Django memverifikasi kredensial, jika benar Django membuat sesi dan mengirim cookie atau token, CookieRequest menyimpan cookie tersebut sehingga request berikutnya dianggap sudah login, Flutter lalu mengubah state aplikasi menjadi “authenticated” dan menavigasi ke menu utama, sedangkan logout dilakukan dengan memanggil endpoint logout di Django yang menghapus sesi di server dan Flutter menghapus state pengguna lalu kembali ke halaman login.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

1. Di run dengan flutter run -d chrome 
2. 