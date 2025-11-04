# mycleats

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Tugas 7
### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah representasi logis dari semua widget antarmuka pengguna dimana setiap widget direpresentasikan di widget tree sebagai salah satu node-nya dengan hubungan induk-anak tertentu. Hubungan induk-anak dalam widget berperan dalam interaksi perubahan sifat widget (dimana widget induk memberikan perintah yang mungkin menyebabkan suatu widget anak untuk berubah sifat), serta dalam penurunan informasi dari suatu widget.
### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
- MyApp: root aplikasi
- MyHomePage: Container untuk widget2 penyusun homepage lainnya
- InfoCard: Sebagai card dari info yang diberikan di field nama, npm, dan kelas di MyHomePage
- ItemCard: Sebagai card dari suatu objek ItemHompage
### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp adalah widget inti yang menyediakan struktur dasar aplikasi Flutter. Widget ini mengatur hal-hal penting seperti:
- Tema (theme): warna, font, dan style default aplikasi.
- Navigasi (routes): mengatur rute halaman dan sistem navigasi.
- Home widget: menentukan tampilan awal aplikasi.
- Localization & title: mendukung terjemahan dan nama aplikasi.
- Debug banner & lainnya.

MaterialApp sering digunakan sebagai widget root karena MaterialApp menyediakan context global untuk akses ke tema dan navigasi; membungkus seluruh UI; dan menjadi fondasi bagi widget lain seperti Scaffold, AppBar, FloatingActionButton, dsb.
### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget Tidak memiliki state internal (Tidak dapat berubah dengan sendirinya) dan StatefulWidget memiliki State object yang menyimpan data state internal sementara. 

StatelessWidget dipakai ketika UI tidak bergantung pada data dinamis (cth: Tombol statis, teks tetap, ikon, dsb.), sedangkan StatefulWidget dipakai ketika UI berubah karena interaksi pengguna atau data (cth: form input, counter, animasi, dsb.)
### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah referensi ke lokasi sebuah widget dalam tree widget Flutter. Setiap widget punya BuildContext sendiri yang memberi tahu di mana posisi widget berada dalam tree serta widget-ancestor mana yang bisa diakses (misalnya Theme.of(context) atau Navigator.of(context)). Di method build, BuildContext digunakan supaya setiap widget tahu di mana posisinya di hierarchy saat UI dibangun ketika method build dipanggil.
### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah tindakan untuk Memuat perubahan kode ke dalam VM dan membangun ulang pohon widget (Memanggil ulang build() setiap widget). Bedanya dengan hot restart adalah hot reload mempertahankan state aplikasi sedangkan hot restart tidak mempertahankan state aplikasi karena hot reload tidak me-restart app flutter (dengan menjalankan ulang main() atau initstate()) seperti dengan hot restart.