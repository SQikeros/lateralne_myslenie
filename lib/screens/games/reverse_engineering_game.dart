import 'package:flutter/material.dart';
import 'dart:math';

class ReverseEngineeringGame extends StatefulWidget {
  const ReverseEngineeringGame({super.key});

  @override
  State<ReverseEngineeringGame> createState() => _ReverseEngineeringGameState();
}

class _ReverseEngineeringGameState extends State<ReverseEngineeringGame> {
  final List<Map<String, dynamic>> _mysterObjects = [
    {
      'name': 'Dziwny haczyk z gumką',
      'emoji': '🪝',
      'hints': ['Ma elastyczną część', 'Używany w domu', 'Pomaga w codziennych czynnościach'],
      'uses': ['Otwieracz do słoików', 'Haczyk do zdejmowania rzeczy z wysoka', 'Ściągacz do butów', 'Narzędzie do otwierania puszek'],
      'correctIndex': 2,
      'explanation': 'To ściągacz do butów! Haczyk pomaga chwycić pętlę buta, a gumka daje elastyczność.',
    },
    {
      'name': 'Metalowy pierścień z dziurkami',
      'emoji': '⭕',
      'hints': ['Metalowy, okrągły', 'Ma małe dziurki', 'Używany w kuchni'],
      'uses': ['Podstawka pod garnek', 'Forma do pieczenia', 'Krajaczdo jajek', 'Tarka do sera'],
      'correctIndex': 2,
      'explanation': 'To krajacz do jajek! Dziurki pozwalają przeciąć ugotowane jajko na równe plastry.',
    },
    {
      'name': 'Plastikowy klips z zębami',
      'emoji': '📎',
      'hints': ['Plastikowy, kolorowy', 'Ma "zęby" po obu stronach', 'Coś trzyma'],
      'uses': ['Spinacz do włosów', 'Klips do torby z chipsami', 'Uchwyt na dokumenty', 'Narzędzie ogrodnicze'],
      'correctIndex': 1,
      'explanation': 'To klips do torby z chipsami! Zęby zamykają torbę i chronią świeżość.',
    },
    {
      'name': 'Drewniany patyk z dziurką',
      'emoji': '🥢',
      'hints': ['Wykonany z drewna', 'Ma dziurkę na końcu', 'Długi i cienki'],
      'uses': ['Pałeczka do mieszania kawy', 'Mieszadło do miodu', 'Narzędzie do robótek ręcznych', 'Patyk do szaszłyków'],
      'correctIndex': 1,
      'explanation': 'To mieszadło do miodu! Dziurki pomagają trzymać miód i łatwiej go przenieść.',
    },
  ];

  int _currentObjectIndex = 0;
  int? _selectedAnswer;
  bool _showExplanation = false;
  final Map<int, String> _userGuesses = {};

  void _nextObject() {
    if (_currentObjectIndex < _mysterObjects.length - 1) {
      setState(() {
        _currentObjectIndex++;
        _selectedAnswer = null;
        _showExplanation = false;
      });
    } else {
      _showFinalScore();
    }
  }

  void _showFinalScore() {
    int correct = 0;
    for (int i = 0; i < _currentObjectIndex + 1; i++) {
      if (_userGuesses[i] != null) {
        final obj = _mysterObjects[i];
        if (obj['uses'][int.parse(_userGuesses[i]!)] == obj['uses'][obj['correctIndex']]) {
          correct++;
        }
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.emoji_events, color: Color(0xFFFBBF24), size: 32),
            SizedBox(width: 12),
            Text('Wyniki!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Poprawnych odpowiedzi:', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text(
              '$correct/${_mysterObjects.length}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF8B5CF6)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentObjectIndex = 0;
                _selectedAnswer = null;
                _showExplanation = false;
                _userGuesses.clear();
              });
            },
            child: const Text('Zagraj ponownie'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8B5CF6)),
            child: const Text('Zamknij'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentObject = _mysterObjects[_currentObjectIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Reverse Engineering'), backgroundColor: const Color(0xFF8B5CF6), foregroundColor: Colors.white),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: const Color(0xFF8B5CF6).withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.search, color: Color(0xFF8B5CF6)),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text('Detektyw Przedmiotów!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text('Odkryj do czego służy tajemniczy przedmiot! Czytaj wskazówki i zgaduj.', style: TextStyle(height: 1.5)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Przedmiot ${_currentObjectIndex + 1}/${_mysterObjects.length}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)]),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: const Color(0xFF8B5CF6).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                      child: Center(child: Text(currentObject['emoji'], style: const TextStyle(fontSize: 60))),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      currentObject['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Wskazówki:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ...(currentObject['hints'] as List<String>).map((hint) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.lightbulb_outline, color: Color(0xFFFBBF24), size: 20),
                        const SizedBox(width: 12),
                        Expanded(child: Text(hint, style: const TextStyle(fontSize: 15, height: 1.4))),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 24),
              const Text('Do czego to służy?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ...(currentObject['uses'] as List<String>).asMap().entries.map((entry) {
                final index = entry.key;
                final use = entry.value;
                final isSelected = _selectedAnswer == index;
                final isCorrect = index == currentObject['correctIndex'];

                return GestureDetector(
                  onTap: _showExplanation
                      ? null
                      : () {
                          setState(() {
                            _selectedAnswer = index;
                            _userGuesses[_currentObjectIndex] = index.toString();
                          });
                        },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _showExplanation
                          ? (isCorrect ? const Color(0xFF10B981).withOpacity(0.2) : (isSelected ? Colors.red.withOpacity(0.2) : Colors.white))
                          : (isSelected ? const Color(0xFF8B5CF6).withOpacity(0.2) : Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _showExplanation
                            ? (isCorrect ? const Color(0xFF10B981) : (isSelected ? Colors.red : Colors.grey[300]!))
                            : (isSelected ? const Color(0xFF8B5CF6) : Colors.grey[300]!),
                        width: _showExplanation && isCorrect ? 3 : 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: _showExplanation
                                ? (isCorrect ? const Color(0xFF10B981) : (isSelected ? Colors.red : Colors.grey[300]))
                                : (isSelected ? const Color(0xFF8B5CF6) : Colors.grey[300]),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                color: (_showExplanation && isCorrect) || isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: Text(use, style: const TextStyle(fontSize: 15))),
                        if (_showExplanation && isCorrect) const Icon(Icons.check_circle, color: Color(0xFF10B981)),
                        if (_showExplanation && !isCorrect && isSelected) const Icon(Icons.cancel, color: Colors.red),
                      ],
                    ),
                  ),
                );
              }),
              if (_selectedAnswer != null && !_showExplanation) ...[
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showExplanation = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5CF6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Sprawdź odpowiedź', style: TextStyle(fontSize: 16)),
                ),
              ],
              if (_showExplanation) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF10B981), width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.info, color: Color(0xFF10B981)),
                          const SizedBox(width: 8),
                          const Text('Wyjaśnienie:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(currentObject['explanation'], style: const TextStyle(fontSize: 15, height: 1.5)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _nextObject,
                  icon: Icon(_currentObjectIndex < _mysterObjects.length - 1 ? Icons.arrow_forward : Icons.check),
                  label: Text(_currentObjectIndex < _mysterObjects.length - 1 ? 'Następny przedmiot' : 'Zobacz wyniki'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5CF6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
