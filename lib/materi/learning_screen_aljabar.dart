import 'package:flutter/material.dart';
import 'quiz_aljabar_screen.dart';

class AljabarScreen extends StatelessWidget {
  const AljabarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aljabar'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Aljabar',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Aljabar adalah cabang matematika yang mempelajari simbol, variabel, dan aturan operasi untuk memanipulasi simbol-simbol tersebut. Aljabar digunakan untuk menyelesaikan masalah yang melibatkan bilangan yang belum diketahui nilainya (variabel).',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('Konsep Dasar Aljabar', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Variabel: Simbol (biasanya huruf) yang mewakili nilai yang belum diketahui, misal x, y, a.'),
                  SizedBox(height: 8),
                  Text('• Konstanta: Nilai tetap, misal 2, 5, -3.'),
                  SizedBox(height: 8),
                  Text('• Koefisien: Bilangan yang mengalikan variabel. Contoh: pada 3x, 3 adalah koefisien.'),
                  SizedBox(height: 8),
                  Text('• Suku: Bagian dari ekspresi aljabar yang dipisahkan oleh tanda + atau -. Contoh: pada 2x + 3y, 2x dan 3y adalah suku.'),
                  SizedBox(height: 8),
                  Text('• Persamaan: Pernyataan matematika dengan tanda sama dengan (=). Contoh: 2x + 3 = 7'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Operasi Aljabar', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Persamaan Kuadrat', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Persamaan kuadrat berbentuk ax² + bx + c = 0. Solusi dicari dengan rumus kuadrat atau pemfaktoran.'),
                  SizedBox(height: 8),
                  Text('Contoh: x² - 5x + 6 = 0 → (x-2)(x-3) = 0 → x = 2 atau x = 3'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Sistem Persamaan Linear', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sistem persamaan linear dua variabel dapat diselesaikan dengan metode substitusi atau eliminasi.'),
                  SizedBox(height: 8),
                  Text('Contoh: x + y = 5 dan x - y = 1 → x = 3, y = 2'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Bentuk Pecahan Aljabar', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bentuk pecahan aljabar melibatkan pembagian antara ekspresi aljabar.'),
                  SizedBox(height: 8),
                  Text('Contoh: (2x + 4) / 2 = x + 2'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Aplikasi Aljabar', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aljabar digunakan untuk memecahkan masalah sehari-hari seperti perhitungan keuangan, jarak, dan waktu.'),
                  SizedBox(height: 8),
                  Text('Contoh: Jika harga sebuah buku adalah x dan harga sebuah pensil adalah y, maka total harga 2 buku dan 3 pensil adalah 2x + 3y.'),
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
                  Text('• Penjumlahan/Pengurangan Suku Sejenis'),
                  Text('  Contoh: 2x + 3x = 5x'),
                  Text('         4y - y = 3y'),
                  SizedBox(height: 8),
                  Text('• Perkalian Aljabar'),
                  Text('  Contoh: 2(x + 3) = 2x + 6'),
                  SizedBox(height: 8),
                  Text('• Pemfaktoran'),
                  Text('  Contoh: x^2 + 5x + 6 = (x + 2)(x + 3)'),
                  SizedBox(height: 8),
                  Text('• Menyelesaikan Persamaan Linear Satu Variabel'),
                  Text('  Contoh: 2x + 3 = 7  →  2x = 4  →  x = 2'),
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
                  Text('1. Selesaikan persamaan: 2x + 3 = 7'),
                  Text('   Pembahasan: 2x + 3 = 7  →  2x = 4  →  x = 2'),
                  SizedBox(height: 8),
                  Text('2. Hitung hasil dari: 3a + 2a - a'),
                  Text('   Pembahasan: 3a + 2a - a = 4a'),
                  SizedBox(height: 8),
                  Text('3. Faktorkan: x^2 + 5x + 6'),
                  Text('   Pembahasan: (x + 2)(x + 3)'),
                  SizedBox(height: 8),
                  Text('4. Hitung hasil dari: 2(x + 4)'),
                  Text('   Pembahasan: 2(x + 4) = 2x + 8'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: Icon(Icons.quiz),
            label: Text('Latihan Aljabar (5 Soal Random)'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizAljabarScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
