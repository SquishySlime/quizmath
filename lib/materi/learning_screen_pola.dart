import 'package:flutter/material.dart';

import 'quiz_pola_screen.dart';

class LearningScreenPola extends StatelessWidget {
  const LearningScreenPola({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pola Bilangan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Pola Bilangan',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Pola bilangan adalah urutan angka yang mengikuti aturan tertentu. Dengan mengenali pola, kita bisa menebak angka berikutnya.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Pola Penjumlahan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Setiap angka bertambah dengan bilangan tertentu.'),
                  SizedBox(height: 8),
                  Text('Contoh: 1, 3, 5, 7, ... (tambah 2)'),
                  Text('Setelah 7 adalah 9'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Pola Perkalian', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Setiap angka dikali dengan bilangan tertentu.'),
                  SizedBox(height: 8),
                  Text('Contoh: 2, 4, 8, 16, ... (kali 2)'),
                  Text('Setelah 16 adalah 32'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Pola Kuadrat', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Setiap angka adalah hasil kuadrat dari bilangan bulat.'),
                  SizedBox(height: 8),
                  Text('Contoh: 1, 4, 9, 16, ... (1^2, 2^2, 3^2, 4^2)'),
                  Text('Setelah 16 adalah 25'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('4. Pola Campuran', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Pola bisa juga berupa gabungan beberapa aturan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 3, 6, 12, 24, ... (kali 2)'),
                  Text('Setelah 24 adalah 48'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Latihan Soal Pola Bilangan'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPolaScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
