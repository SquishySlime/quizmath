import 'package:flutter/material.dart';

class QuizBarisanScreen extends StatefulWidget {
  const QuizBarisanScreen({super.key});
  @override
  State<QuizBarisanScreen> createState() => _QuizBarisanScreenState();
}

class _QuizBarisanScreenState extends State<QuizBarisanScreen> {
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
                      Text('Soal ${idx + 1}: ${q['question']}', style: const TextStyle(fontWeight: FontWeight.bold)),
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
        'question': 'Barisan: 2, 4, 6, 8, ... Suku ke-5 adalah?',
        'choices': ['10', '12', '14', '16']..shuffle(),
        'answer': '10',
        'explanation': 'Barisan aritmatika, beda 2. Suku ke-5: 2 + (5-1)×2 = 10.',
      },
      {
        'question': 'Barisan: 3, 6, 12, 24, ... Suku ke-5 adalah?',
        'choices': ['48', '36', '30', '60']..shuffle(),
        'answer': '48',
        'explanation': 'Barisan geometri, rasio 2. Suku ke-5: 3×2^4 = 48.',
      },
      {
        'question': 'Jumlah 3 suku pertama barisan 5, 10, 15, ... adalah?',
        'choices': ['30', '45', '25', '40']..shuffle(),
        'answer': '30',
        'explanation': '5+10+15=30.',
      },
      {
        'question': 'Jika Un = 2 + (n-1)×5, maka suku ke-4 adalah?',
        'choices': ['17', '12', '22', '7']..shuffle(),
        'answer': '17',
        'explanation': 'U4 = 2 + (4-1)×5 = 2+15=17.',
      },
      {
        'question': 'Barisan: 1, 3, 9, 27, ... Suku ke-6 adalah?',
        'choices': ['243', '81', '729', '162']..shuffle(),
        'answer': '243',
        'explanation': 'Barisan geometri, rasio 3. Suku ke-6: 1×3^5=243.',
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
        appBar: AppBar(title: const Text('Latihan Barisan & Deret')),
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
                onPressed: () => Navigator.pushReplacementNamed(context, '/quiz_pola'),
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
      appBar: AppBar(title: const Text('Latihan Barisan & Deret')),
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
