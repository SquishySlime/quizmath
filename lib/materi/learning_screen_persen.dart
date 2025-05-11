import 'package:flutter/material.dart';

import 'quiz_persen_screen.dart';

class LearningScreenPersen extends StatelessWidget {
  const LearningScreenPersen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Persen & Perbandingan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Persen & Perbandingan',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Persen adalah per seratus (%). Digunakan untuk menunjukkan bagian dari 100. Perbandingan adalah membandingkan dua besaran, bisa dalam bentuk a:b atau pecahan.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Menghitung Persen', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Persen menunjukkan bagian dari 100.'),
                  SizedBox(height: 8),
                  Text('Contoh: 25 dari 100 = 25%'),
                  Text('Contoh: 40 dari 80 = (40/80) x 100% = 50%'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Diskon dan Harga Setelah Diskon', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Diskon biasanya dinyatakan dalam persen.'),
                  SizedBox(height: 8),
                  Text('Contoh: Harga Rp200.000 didiskon 25%'),
                  Text('Diskon = 25% x 200.000 = 50.000'),
                  Text('Harga akhir = 200.000 - 50.000 = 150.000'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Perbandingan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Perbandingan bisa dalam bentuk a:b atau pecahan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 2 banding 3 = 2/3'),
                  Text('Contoh: 4 banding 5 = 4/5'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('4. Persen ke Pecahan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Persen dapat diubah menjadi pecahan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 40% = 40/100 = 2/5'),
                  Text('Contoh: 60% = 60/100 = 3/5'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Latihan Soal Persen & Perbandingan'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPersenScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
