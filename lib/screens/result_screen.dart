import 'package:flutter/material.dart';


class ResultScreen extends StatefulWidget {
  final int score;
  final int total;
  final String explanation;

  const ResultScreen({Key? key, required this.score, required this.total, required this.explanation}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, dynamic>> _scores = [];
  String? _userName;
  bool _isTopScore = false;



  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Center(
                child: Icon(Icons.emoji_events, size: 68, color: Colors.amber.shade700),
              ),
              const SizedBox(height: 16),
              Text(
                'Skor Anda',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDark ? Colors.amber : Colors.deepPurple),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.score} / ${widget.total}',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black),
              ),
              if (_isTopScore)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Selamat! Skor Anda masuk leaderboard!', style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold)),
                ),
              const SizedBox(height: 16),
              // Penjelasan soal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.explanation.isNotEmpty ? widget.explanation : 'Penjelasan soal tidak tersedia.',
                  style: TextStyle(fontSize: 16, color: isDark ? Colors.amber : Colors.deepPurple),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              Text('Leaderboard', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: _scores.isEmpty
                    ? const Center(child: Text('Belum ada skor!'))
                    : ListView.builder(
                        itemCount: _scores.length,
                        itemBuilder: (context, index) {
                          final entry = _scores[index];
                          final isCurrent = entry['name'] == _userName && entry['score'] == widget.score;
                          return Card(
                            color: isCurrent ? Colors.amber.shade100 : null,
                            child: ListTile(
                              leading: CircleAvatar(child: Text('#${index + 1}')),
                              title: Text(entry['name'] ?? '-'),
                              trailing: Text('${entry['score']}'),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.home),
                    label: const Text('Kembali ke Beranda'),
                    onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.leaderboard),
                    label: const Text('Lihat Leaderboard'),
                    onPressed: () => Navigator.pushNamed(context, '/leaderboard'),
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
