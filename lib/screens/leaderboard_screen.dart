import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<Map<String, dynamic>> _scores = [];

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    final scoresData = prefs.getStringList('leaderboard') ?? [];
    final scores = scoresData.map((e) {
      final parts = e.split('|');
      if (parts.length < 2) {
        return {'name': '-', 'score': 0};
      }
      return {
        'name': parts[0],
        'score': int.tryParse(parts[1]) ?? 0,
      };
    }).toList();
    scores.sort((a, b) {
      final scoreA = a['score'] is int ? a['score'] as int : 0;
      final scoreB = b['score'] is int ? b['score'] as int : 0;
      return scoreB.compareTo(scoreA);
    });
    setState(() {
      _scores = scores.take(10).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: _scores.isEmpty
          ? const Center(child: Text('Belum ada skor!'))
          : ListView.builder(
              itemCount: _scores.length,
              itemBuilder: (context, index) {
                final entry = _scores[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('#${index + 1}')),
                  title: Text(entry['name'] ?? '-'),
                  trailing: Text('${entry['score']}'),
                );
              },
            ),
    );
  }
}
