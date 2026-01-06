import 'package:flutter/material.dart';
import 'dart:math';

class RandomConnectionGame extends StatefulWidget {
  const RandomConnectionGame({super.key});

  @override
  State<RandomConnectionGame> createState() => _RandomConnectionGameState();
}

class _RandomConnectionGameState extends State<RandomConnectionGame> {
  final List<String> _words1 = ['🍕 Pizza', '🚗 Samochód', '📱 Telefon', '🌳 Drzewo', '⚽ Piłka', '📚 Książka', '🎵 Muzyka', '☕ Kawa'];

  final List<String> _words2 = ['🚀 Rakieta', '🎨 Sztuka', '⏰ Czas', '💡 Światło', '🌊 Woda', '🔥 Ogień', '🌈 Tęcza', '⭐ Gwiazda'];

  String _currentWord1 = '';
  String _currentWord2 = '';
  String _userIdea = '';
  final List<String> _savedIdeas = [];
  bool _showExplanation = true;

  @override
  void initState() {
    super.initState();
    _generateNewPair();
  }

  void _generateNewPair() {
    setState(() {
      _currentWord1 = _words1[Random().nextInt(_words1.length)];
      _currentWord2 = _words2[Random().nextInt(_words2.length)];
      _userIdea = '';
    });
  }

  void _saveIdea() {
    if (_userIdea.isNotEmpty) {
      setState(() {
        _savedIdeas.add('$_currentWord1 + $_currentWord2 = $_userIdea');
        _userIdea = '';
      });
      _generateNewPair();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pomysł zapisany! 💡'), duration: Duration(seconds: 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Losowe Połączenia'),
        backgroundColor: const Color(0xFFEC4899),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              setState(() {
                _showExplanation = !_showExplanation;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_showExplanation)
                  Card(
                    color: const Color(0xFFEC4899).withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.lightbulb, color: Color(0xFFEC4899)),
                              const SizedBox(width: 8),
                              const Text('Jak to działa?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Technika Random Input polega na łączeniu losowych, niepowiązanych pojęć. To zmusza mózg do tworzenia nowych połączeń neuronowych i odkrywania nieoczekiwanych rozwiązań.',
                            style: TextStyle(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                const Text(
                  'Połącz te dwa pojęcia:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildWordCard(_currentWord1, const Color(0xFFEC4899)),
                    const Icon(Icons.add, size: 24, color: Color(0xFFEC4899)),
                    _buildWordCard(_currentWord2, const Color(0xFF8B5CF6)),
                  ],
                ),
                const SizedBox(height: 32),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Wpisz swój kreatywny pomysł...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  onChanged: (value) {
                    setState(() {
                      _userIdea = value;
                    });
                  },
                  controller: TextEditingController(text: _userIdea)..selection = TextSelection.collapsed(offset: _userIdea.length),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _saveIdea,
                        icon: const Icon(Icons.save),
                        label: const Text('Zapisz pomysł'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEC4899),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: _generateNewPair,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Nowa para'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B5CF6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
                if (_savedIdeas.isNotEmpty) ...[
                  const SizedBox(height: 32),
                  const Text('Twoje pomysły:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ..._savedIdeas.asMap().entries.map((entry) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFFEC4899),
                          child: Text('${entry.key + 1}', style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text(entry.value),
                      ),
                    );
                  }),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWordCard(String word, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        word,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
