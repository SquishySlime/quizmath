import 'package:flutter/material.dart';
import 'quiz_geometri_screen.dart';

class GeometriScreen extends StatelessWidget {
  const GeometriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geometri'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Geometri',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Geometri adalah cabang matematika yang mempelajari tentang bangun ruang dan bangun datar, sifat-sifat, ukuran, dan hubungan antar bangun tersebut.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('Konsep Dasar Geometri', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Titik, Garis, dan Bidang'),
                  Text('  Titik: Posisi tanpa ukuran.'),
                  Text('  Garis: Kumpulan titik yang memanjang tanpa batas.'),
                  Text('  Bidang: Permukaan datar yang memanjang tanpa batas.'),
                  SizedBox(height: 8),
                  Text('• Bangun Datar: Segitiga, persegi, persegi panjang, lingkaran, trapesium, dll.'),
                  SizedBox(height: 8),
                  Text('• Bangun Ruang: Kubus, balok, prisma, tabung, limas, bola, dll.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Rumus Penting Geometri', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Sifat-sifat Sudut', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sudut pada garis lurus berjumlah 180°, sudut pada titik berjumlah 360°.'),
                  SizedBox(height: 8),
                  Text('Contoh: Jika sudut A dan sudut B membentuk garis lurus dan sudut A = 120°, maka sudut B = 60°.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Teorema Pythagoras', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pada segitiga siku-siku: a² + b² = c², dengan c adalah sisi miring.'),
                  SizedBox(height: 8),
                  Text('Contoh: Jika a = 3, b = 4, maka c = √(9+16) = 5'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Transformasi Geometri', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Transformasi meliputi translasi (geser), rotasi (putar), refleksi (cermin), dan dilatasi (perbesaran/perkecilan).'),
                  SizedBox(height: 8),
                  Text('Contoh: Translasi titik (2,3) sejauh (1,2) menjadi (3,5)'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Bangun Ruang Kompleks', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bangun ruang seperti limas, kerucut, bola memiliki rumus volume dan luas permukaan khusus.'),
                  SizedBox(height: 8),
                  Text('Contoh: Volume bola = 4/3 × π × r³'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Aplikasi Geometri', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Geometri digunakan dalam arsitektur, teknik, desain, dan navigasi sehari-hari.'),
                  SizedBox(height: 8),
                  Text('Contoh: Menghitung luas tanah, volume air di tangki, dll.'),
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
                  Text('• Keliling Persegi: 4 × sisi'),
                  Text('• Luas Persegi: sisi × sisi'),
                  Text('• Keliling Persegi Panjang: 2 × (panjang + lebar)'),
                  Text('• Luas Persegi Panjang: panjang × lebar'),
                  Text('• Keliling Lingkaran: 2 × π × r'),
                  Text('• Luas Lingkaran: π × r × r'),
                  Text('• Volume Kubus: sisi × sisi × sisi'),
                  Text('• Volume Balok: panjang × lebar × tinggi'),
                  Text('• Volume Tabung: π × r × r × t'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Contoh Soal dan Pembahasan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Hitung luas persegi dengan sisi 5 cm'),
                  Text('   Pembahasan: Luas = 5 × 5 = 25 cm²'),
                  SizedBox(height: 8),
                  Text('2. Hitung keliling lingkaran dengan jari-jari 7 cm (π ≈ 22/7)'),
                  Text('   Pembahasan: Keliling = 2 × 22/7 × 7 = 44 cm'),
                  SizedBox(height: 8),
                  Text('3. Hitung volume balok dengan panjang 4 cm, lebar 3 cm, dan tinggi 2 cm'),
                  Text('   Pembahasan: Volume = 4 × 3 × 2 = 24 cm³'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: Icon(Icons.quiz),
            label: Text('Latihan Geometri (5 Soal Random)'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizGeometriScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
