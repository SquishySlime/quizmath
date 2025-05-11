import 'package:flutter/material.dart';

import 'quiz_himpunan_screen.dart';

class LearningScreenHimpunan extends StatelessWidget {
  const LearningScreenHimpunan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Himpunan & Logika'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Himpunan & Logika',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Himpunan adalah kumpulan objek yang terdefinisi dengan jelas. Contoh: A = {1,2,3}. Logika matematika digunakan untuk menarik kesimpulan.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text('1. Operasi Himpunan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Gabungan (∪): Semua anggota dari kedua himpunan.'),
                  Text('Irisan (∩): Anggota yang sama di kedua himpunan.'),
                  Text('Komplemen: Anggota semesta yang tidak ada di himpunan.'),
                  SizedBox(height: 8),
                  Text('Contoh: A = {1,2,3,4}, B = {3,4,5,6}'),
                  Text('A ∪ B = {1,2,3,4,5,6}'),
                  Text('A ∩ B = {3,4}'),
                  Text('Jika semesta S = {1,2,3,4,5}, komplemen A = {3,5}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('2. Diagram Venn', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Diagram Venn digunakan untuk memvisualisasikan hubungan antar himpunan.'),
                  SizedBox(height: 8),
                  Text('Contoh: Dua lingkaran yang saling beririsan menggambarkan A ∩ B.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('3. Logika Dasar', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Logika matematika meliputi pernyataan benar/salah, negasi (tidak), konjungsi (dan), disjungsi (atau).'),
                  SizedBox(height: 8),
                  Text('Contoh: Pernyataan "2 > 1" adalah benar.'),
                  Text('Negasi dari "2 > 1" adalah "2 ≤ 1".'),
                  Text('Konjungsi: "2 > 1 dan 3 > 2".'),
                  Text('Disjungsi: "2 > 1 atau 1 > 3".'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Latihan Soal Himpunan & Logika'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizHimpunanScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
