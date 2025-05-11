import 'package:flutter/material.dart';
import 'quiz_aritmatika_screen.dart';

class AritmatikaScreen extends StatelessWidget {
  const AritmatikaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aritmatika Dasar'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Aritmatika Dasar',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Aritmatika dasar adalah cabang matematika yang mempelajari operasi hitung sederhana seperti penjumlahan, pengurangan, perkalian, dan pembagian. Materi ini merupakan pondasi penting dalam matematika dan kehidupan sehari-hari.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Penjumlahan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Penjumlahan adalah operasi untuk menghitung total dari dua atau lebih bilangan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 7 + 5 = 12'),
                  Text('Contoh: 10 + 4 + 2 = 16'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Pengurangan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pengurangan adalah operasi untuk mencari selisih antara dua bilangan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 10 - 4 = 6'),
                  Text('Contoh: 15 - 7 = 8'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Perkalian', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Perkalian adalah operasi penjumlahan berulang dari bilangan yang sama.'),
                  SizedBox(height: 8),
                  Text('Contoh: 3 × 4 = 12 (artinya 3 + 3 + 3 + 3 = 12)'),
                  Text('Contoh: 5 × 2 = 10'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('4. Pembagian', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pembagian adalah operasi untuk membagi suatu bilangan menjadi beberapa bagian yang sama besar.'),
                  SizedBox(height: 8),
                  Text('Contoh: 20 ÷ 5 = 4 (artinya 20 dibagi menjadi 5 bagian, tiap bagian 4)'),
                  Text('Contoh: 18 ÷ 3 = 6'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Sifat-sifat Operasi Aritmatika', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Operasi Campuran', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Operasi campuran melibatkan lebih dari satu jenis operasi aritmatika dalam satu soal.'),
                  SizedBox(height: 8),
                  Text('Contoh: 3 + 4 × 2 = 3 + 8 = 11 (ingat urutan operasi: perkalian didahulukan)'),
                  Text('Contoh: (5 + 2) × 3 = 7 × 3 = 21'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Bilangan Negatif', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bilangan negatif adalah bilangan kurang dari nol. Operasi aritmatika dapat melibatkan bilangan negatif.'),
                  SizedBox(height: 8),
                  Text('Contoh: -3 + 7 = 4'),
                  Text('Contoh: 5 - 9 = -4'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Urutan Operasi (Prioritas)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Urutan pengerjaan: tanda kurung > perkalian/pembagian > penjumlahan/pengurangan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 2 + 3 × 4 = 2 + 12 = 14'),
                  Text('Contoh: (2 + 3) × 4 = 5 × 4 = 20'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Soal Cerita & Aplikasi', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aritmatika sering digunakan dalam kehidupan sehari-hari, seperti menghitung uang, waktu, jarak, dan sebagainya.'),
                  SizedBox(height: 8),
                  Text('Contoh: Jika Ani memiliki 5 apel dan membeli lagi 3 apel, maka Ani memiliki 5 + 3 = 8 apel.'),
                  Text('Contoh: Seseorang berjalan 2 km ke utara, lalu 3 km ke selatan. Berapa jarak total yang ditempuh? 2 + 3 = 5 km.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Komutatif: a + b = b + a, a × b = b × a'),
                  Text('• Asosiatif: (a + b) + c = a + (b + c), (a × b) × c = a × (b × c)'),
                  Text('• Distributif: a × (b + c) = a × b + a × c'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Contoh Soal dan Pembahasan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. 12 + 8 = 20'),
                  Text('2. 15 - 7 = 8'),
                  Text('3. 6 × 5 = 30'),
                  Text('4. 24 ÷ 6 = 4'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: Icon(Icons.quiz),
            label: Text('Latihan Aritmatika (5 Soal Random)'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizAritmatikaScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
