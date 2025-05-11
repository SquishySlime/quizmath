import 'package:flutter/material.dart';

class QuizHimpunanScreen extends StatefulWidget {
  const QuizHimpunanScreen({super.key});
  @override
  State<QuizHimpunanScreen> createState() => _QuizHimpunanScreenState();
}

class _QuizHimpunanScreenState extends State<QuizHimpunanScreen> {
  void _showPembahasanDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pembahasan Soal'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _questions.length,
              itemBuilder: (context, idx) {
                final q = _questions[idx];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Soal ${idx + 1} dari ${_questions.length}: ${q['question']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Jawaban: ${q['answer']}'),
                      const SizedBox(height: 4),
                      Text('Pembahasan: ${q['explanation']}'),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
  late List<Map<String, dynamic>> _questions;
  int _current = 0;
  int _score = 0;
  String? _selected;
  bool _showResult = false;

  @override
  void initState() {
    super.initState();
    _generateQuestions();
  }

  void _generateQuestions() {
    _questions = [
      {
        'question': 'Jika A = {1,2,3,4}, B = {3,4,5,6}, maka A ∩ B = ...',
        'choices': ['{3,4}', '{1,2}', '{5,6}', '{1,2,3,4,5,6}']..shuffle(),
        'answer': '{3,4}',
        'explanation': 'Irisan adalah anggota yang sama di kedua himpunan.',
      },
      {
        'question': 'Jika A = {1,3,5}, B = {2,3,4}, maka A ∪ B = ...',
        'choices': ['{1,2,3,4,5}', '{3}', '{1,3,5}', '{2,3,4}']..shuffle(),
        'answer': '{1,2,3,4,5}',
        'explanation': 'Gabungan adalah semua anggota dari kedua himpunan.',
      },
      {
        'question': 'Diagram Venn digunakan untuk ...',
        'choices': ['Menunjukkan hubungan antar himpunan', 'Menghitung luas lingkaran', 'Menggambar grafik', 'Menghitung volume']..shuffle(),
        'answer': 'Menunjukkan hubungan antar himpunan',
        'explanation': 'Diagram Venn untuk visualisasi himpunan.',
      },
      {
        'question': 'Anggota dari himpunan bilangan genap antara 1 dan 10 adalah ...',
        'choices': ['2,4,6,8,10', '1,3,5,7,9', '1,2,3,4,5', '2,3,5,7']..shuffle(),
        'answer': '2,4,6,8,10',
        'explanation': 'Bilangan genap antara 1 dan 10.',
      },
      {
        'question': 'Jika semesta S = {1,2,3,4,5}, A = {2,4}, maka komplemen A adalah ...',
        'choices': ['{1,3,5}', '{2,4}', '{1,2,3,4,5}', '{3,4,5}']..shuffle(),
        'answer': '{1,3,5}',
        'explanation': 'Komplemen A adalah anggota S yang tidak ada di A.',
      },
    ];
  }

  void _next() {
    if (_selected == _questions[_current]['answer']) {
      _score++;
    }
    if (_current < _questions.length - 1) {
      setState(() {
        _current++;
        _selected = null;
      });
    } else {
      setState(() {
        _showResult = true;
      });
    }
  }

  void _restart() {
    _generateQuestions();
    setState(() {
      _current = 0;
      _score = 0;
      _selected = null;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return Scaffold(
        appBar: AppBar(title: const Text('Latihan Himpunan & Logika')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Skor Anda: $_score / ${_questions.length}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _restart,
                child: const Text('Ulangi Materi'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/quiz_statistika'),
                child: const Text('Lanjut ke Materi Selanjutnya'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.info_outline),
                onPressed: _showPembahasanDialog,
                label: const Text('Lihat Pembahasan'),
              ),
            ],
          ),
        ),
      );
    }
    final q = _questions[_current];
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Himpunan & Logika')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Soal ${_current + 1} dari ${_questions.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(q['question'], style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ...List.generate(q['choices'].length, (i) {
              final c = q['choices'][i];
              return RadioListTile<String>(
                title: Text(c),
                value: c,
                groupValue: _selected,
                onChanged: (val) {
                  setState(() {
                    _selected = val;
                  });
                },
              );
            }),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selected == null ? null : _next,
                    child: Text(_current == _questions.length - 1 ? 'Selesai' : 'Selanjutnya'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
