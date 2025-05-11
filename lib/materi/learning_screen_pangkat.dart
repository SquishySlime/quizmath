import 'package:flutter/material.dart';

import 'quiz_pangkat_screen.dart';

class LearningScreenPangkat extends StatelessWidget {
  const LearningScreenPangkat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Pangkat & Akar'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Pangkat & Akar',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Pangkat adalah perkalian berulang dari suatu bilangan. Contoh: 2^3 = 2 x 2 x 2 = 8. Akar adalah kebalikan dari pangkat. Contoh: akar kuadrat dari 9 adalah 3, karena 3^2 = 9.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Pangkat Dua (Kuadrat)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Pangkat dua berarti bilangan dikalikan dengan dirinya sendiri.'),
                  SizedBox(height: 8),
                  Text('Contoh: 4^2 = 4 x 4 = 16'),
                  Text('Contoh: 3^2 = 3 x 3 = 9'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Pangkat Tiga (Kubik)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Pangkat tiga berarti bilangan dikalikan dengan dirinya sendiri tiga kali.'),
                  SizedBox(height: 8),
                  Text('Contoh: 2^3 = 2 x 2 x 2 = 8'),
                  Text('Contoh: 5^3 = 5 x 5 x 5 = 125'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Akar Kuadrat', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Akar kuadrat adalah kebalikan dari pangkat dua.'),
                  SizedBox(height: 8),
                  Text('Contoh: √16 = 4 karena 4^2 = 16'),
                  Text('Contoh: √49 = 7 karena 7^2 = 49'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('4. Akar Kubik', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Akar kubik adalah kebalikan dari pangkat tiga.'),
                  SizedBox(height: 8),
                  Text('Contoh: ³√27 = 3 karena 3^3 = 27'),
                  Text('Contoh: ³√8 = 2 karena 2^3 = 8'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Latihan Soal Pangkat & Akar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPangkatScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
