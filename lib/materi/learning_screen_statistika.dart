import 'package:flutter/material.dart';

import 'quiz_statistika_screen.dart';

class LearningScreenStatistika extends StatelessWidget {
  const LearningScreenStatistika({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Statistika Dasar'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Statistika Dasar',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Statistika adalah cabang matematika yang mempelajari cara mengumpulkan, mengolah, dan menyajikan data. Materi dasar statistika antara lain rata-rata, median, modus, dan membaca grafik/tabel.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Rata-rata', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Rata-rata (mean) adalah jumlah seluruh data dibagi banyaknya data.'),
                  SizedBox(height: 8),
                  Text('Contoh: Data: 4, 6, 8, 10'),
                  Text('Rata-rata = (4+6+8+10)/4 = 28/4 = 7'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Median', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Median adalah nilai tengah dari data yang sudah diurutkan.'),
                  SizedBox(height: 8),
                  Text('Contoh: Data: 2, 3, 5, 7, 8, 11'),
                  Text('Median = (5+7)/2 = 6'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Modus', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Modus adalah nilai yang paling sering muncul dalam data.'),
                  SizedBox(height: 8),
                  Text('Contoh: Data: 3, 5, 7, 7, 8, 9, 10'),
                  Text('Modus = 7'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('4. Menyajikan Data (Grafik/Tabel)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Data dapat disajikan dalam bentuk tabel atau grafik untuk memudahkan analisis.'),
                  SizedBox(height: 8),
                  Text('Contoh tabel nilai siswa:'),
                  Text('Nama | Nilai'),
                  Text('-----|------'),
                  Text('Andi | 80'),
                  Text('Budi | 90'),
                  Text('Cici | 70'),
                  SizedBox(height: 8),
                  Text('Contoh grafik batang, lingkaran, dsb.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Latihan Soal Statistika'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizStatistikaScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
