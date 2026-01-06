import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class WordSprintGame extends StatefulWidget {
  const WordSprintGame({super.key});

  @override
  State<WordSprintGame> createState() => _WordSprintGameState();
}

class _WordSprintGameState extends State<WordSprintGame> {
  final List<String> _words = ['Woda', 'Ogień', 'Laptop', 'Piłka', 'Chmura', 'Drzewo', 'Książka', 'Muzyka', 'Światło', 'Czas', 'Telefon', 'Rower'];

  String _currentWord = '';
  final List<String> _associations = [];
  final TextEditingController _textController = TextEditingController();
  Timer? _timer;
  int _secondsLeft = 60;
  bool _isPlaying = false;
  bool _gameFinished = false;

  @override
  void initState() {
    super.initState();
    _currentWord = _words[Random().nextInt(_words.length)];
  }

  @override
  void dispose() {
    _timer?.cancel();
    _textController.dispose();
    super.dispose();
  }

  void _startGame() {
    setState(() {
      _isPlaying = true;
      _gameFinished = false;
      _secondsLeft = 60;
      _associations.clear();
      _currentWord = _words[Random().nextInt(_words.length)];
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          _finishGame();
        }
      });
    });
  }

  void _addAssociation() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _associations.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _finishGame() {
    _timer?.cancel();
    setState(() {
      _isPlaying = false;
      _gameFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Word Sprint'), backgroundColor: const Color(0xFFDC2626), foregroundColor: Colors.white),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: const Color(0xFFDC2626).withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.flash_on, color: Color(0xFFDC2626)),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text('Wyzwanie 60 sekund!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text('Ile skojarzeń wymyślisz w minutę? Wpisuj szybko i klikaj Enter!', style: TextStyle(height: 1.5)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              if (!_isPlaying && !_gameFinished)
                Column(
                  children: [
                    const Icon(Icons.flash_on, size: 80, color: Color(0xFFDC2626)),
                    const SizedBox(height: 24),
                    const Text('Gotowy?', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: _startGame,
                      icon: const Icon(Icons.play_arrow, size: 32),
                      label: const Text('START', style: TextStyle(fontSize: 24)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDC2626),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              if (_isPlaying) ...[
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [_secondsLeft <= 10 ? Colors.red : const Color(0xFFDC2626), _secondsLeft <= 10 ? Colors.orange : const Color(0xFFEF4444)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: const Color(0xFFDC2626).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$_secondsLeft',
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [Shadow(color: Colors.black.withOpacity(0.3), offset: const Offset(0, 4), blurRadius: 8)],
                        ),
                      ),
                      const Text('sekund', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFDC2626), width: 3),
                  ),
                  child: Text(
                    _currentWord,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFDC2626)),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        autofocus: true,
                        onSubmitted: (_) => _addAssociation(),
                        decoration: InputDecoration(
                          hintText: 'Wpisz skojarzenie...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFDC2626), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _addAssociation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDC2626),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Icon(Icons.add, size: 28),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: const Color(0xFFDC2626).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.list, color: Color(0xFFDC2626)),
                      const SizedBox(width: 8),
                      Text(
                        'Skojarzeń: ${_associations.length}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDC2626)),
                      ),
                    ],
                  ),
                ),
                if (_associations.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _associations.map((word) {
                      return Chip(
                        label: Text(word),
                        backgroundColor: const Color(0xFFDC2626).withOpacity(0.2),
                        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                      );
                    }).toList(),
                  ),
                ],
              ],
              if (_gameFinished) ...[
                const Icon(Icons.celebration, size: 100, color: Color(0xFFFBBF24)),
                const SizedBox(height: 24),
                const Text(
                  'Koniec!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFDC2626), Color(0xFFEF4444)]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text('Twój wynik:', style: TextStyle(fontSize: 20, color: Colors.white)),
                      const SizedBox(height: 12),
                      Text(
                        '${_associations.length}',
                        style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const Text('skojarzeń', style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                if (_associations.isNotEmpty) ...[
                  const Text('Twoje skojarzenia:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _associations.map((word) {
                      return Chip(
                        label: Text(word),
                        backgroundColor: const Color(0xFFDC2626).withOpacity(0.2),
                        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],
                ElevatedButton.icon(
                  onPressed: _startGame,
                  icon: const Icon(Icons.replay),
                  label: const Text('Zagraj ponownie'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC2626),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
