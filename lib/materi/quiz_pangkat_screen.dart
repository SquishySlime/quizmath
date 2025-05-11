import 'package:flutter/material.dart';

class QuizPangkatScreen extends StatefulWidget {
  const QuizPangkatScreen({super.key});
  @override
  State<QuizPangkatScreen> createState() => _QuizPangkatScreenState();
}

class _QuizPangkatScreenState extends State<QuizPangkatScreen> {
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
        'question': '2 pangkat 3 = ...',
        'choices': ['8', '6', '9', '12']..shuffle(),
        'answer': '8',
        'explanation': '2^3 = 2x2x2 = 8.',
      },
      {
        'question': 'Akar kuadrat dari 49 adalah ...',
        'choices': ['7', '6', '8', '9']..shuffle(),
        'answer': '7',
        'explanation': '√49 = 7.',
      },
      {
        'question': '3 pangkat 2 = ...',
        'choices': ['9', '6', '8', '12']..shuffle(),
        'answer': '9',
        'explanation': '3^2 = 3x3 = 9.',
      },
      {
        'question': 'Akar kubik dari 27 adalah ...',
        'choices': ['3', '9', '6', '4']..shuffle(),
        'answer': '3',
        'explanation': '³√27 = 3.',
      },
      {
        'question': '5 pangkat 0 = ...',
        'choices': ['1', '0', '5', '10']..shuffle(),
        'answer': '1',
        'explanation': 'Setiap bilangan pangkat 0 hasilnya 1.',
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
        appBar: AppBar(title: const Text('Latihan Pangkat & Akar')),
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
                onPressed: () => Navigator.pushReplacementNamed(context, '/quiz_barisan'),
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
      appBar: AppBar(title: const Text('Latihan Pangkat & Akar')),
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
