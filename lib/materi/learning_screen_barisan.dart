import 'package:flutter/material.dart';

import 'quiz_barisan_screen.dart';

class LearningScreenBarisan extends StatelessWidget {
  const LearningScreenBarisan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Barisan & Deret'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Barisan & Deret',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Barisan adalah urutan bilangan dengan pola tertentu. Deret adalah penjumlahan dari barisan. Barisan aritmatika memiliki beda tetap, sedangkan barisan geometri memiliki rasio tetap.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Barisan Aritmatika', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Barisan aritmatika adalah barisan dengan selisih (beda) tetap.'),
                  SizedBox(height: 8),
                  Text('Contoh: 2, 4, 6, 8, ... (beda = 2)'),
                  Text('Suku ke-n: Un = a + (n-1)b'),
                  Text('Contoh: Suku ke-5 dari 2, 4, 6, 8, ... adalah 2 + (5-1)×2 = 10'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Barisan Geometri', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Barisan geometri adalah barisan dengan rasio tetap.'),
                  SizedBox(height: 8),
                  Text('Contoh: 3, 6, 12, 24, ... (rasio = 2)'),
                  Text('Suku ke-n: Un = a × r^(n-1)'),
                  Text('Contoh: Suku ke-5 dari 3, 6, 12, 24, ... adalah 3×2^4 = 48'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Deret', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Deret adalah hasil penjumlahan beberapa suku barisan.'),
                  SizedBox(height: 8),
                  Text('Contoh: 5 + 10 + 15 = 30'),
                  Text('Contoh: 1 + 3 + 9 = 13'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Latihan Soal Barisan & Deret'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizBarisanScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
