import 'package:flutter/material.dart';

import 'quiz_pecahan_screen.dart';

class LearningScreenPecahan extends StatelessWidget {
  const LearningScreenPecahan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pecahan & Desimal'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Pecahan & Desimal',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Pecahan adalah bilangan yang terdiri dari pembilang dan penyebut (misal: 1/2, 3/4). Desimal adalah bentuk lain dari pecahan (misal: 0,5 = 1/2).',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Penjumlahan dan Pengurangan Pecahan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Untuk menjumlahkan atau mengurangkan pecahan, samakan dulu penyebutnya.'),
                  SizedBox(height: 8),
                  Text('Contoh: 1/2 + 1/4 = 2/4 + 1/4 = 3/4'),
                  Text('Contoh: 3/5 - 1/5 = 2/5'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Perkalian dan Pembagian Pecahan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Perkalian pecahan: kalikan pembilang dan penyebut langsung.'),
                  Text('Pembagian pecahan: balik pecahan kedua lalu dikalikan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 2/3 x 3/4 = 6/12 = 1/2'),
                  Text('Contoh: 1/2 : 1/4 = 1/2 x 4/1 = 4/2 = 2'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Desimal ke Pecahan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Desimal bisa diubah ke pecahan dengan membuat penyebut 10, 100, dst.'),
                  SizedBox(height: 8),
                  Text('Contoh: 0,6 = 6/10 = 3/5'),
                  Text('Contoh: 0,75 = 75/100 = 3/4'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('4. Persen', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Persen adalah pecahan dengan penyebut 100.'),
                  SizedBox(height: 8),
                  Text('Contoh: 25% = 25/100 = 0,25'),
                  Text('Contoh: 60% = 60/100 = 3/5'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Latihan Soal Pecahan & Desimal'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPecahanScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
