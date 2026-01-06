import 'package:flutter/material.dart';
import 'dart:math';

class AnalogiesGame extends StatefulWidget {
  const AnalogiesGame({super.key});

  @override
  State<AnalogiesGame> createState() => _AnalogiesGameState();
}

class _AnalogiesGameState extends State<AnalogiesGame> {
  final List<Map<String, dynamic>> _problems = [
    {
      'problem': 'Jak zmotywować zespół do pracy?',
      'cards': [
        {'emoji': '🌳', 'name': 'Drzewo', 'analogy': 'Potrzebne są silne korzenie (wartości) i przestrzeń do wzrostu'},
        {'emoji': '🎼', 'name': 'Orkiestra', 'analogy': 'Każdy gra swoją partię, ale razem tworzą harmonię'},
        {'emoji': '🏃', 'name': 'Maraton', 'analogy': 'Liczy się rytm i dystans, nie tylko sprint'},
        {'emoji': '🔥', 'name': 'Ogień', 'analogy': 'Trzeba go rozpalić i dokładać drewna (uznania)'},
        {'emoji': '🌊', 'name': 'Fala', 'analogy': 'Energia przenosi się z jednej osoby na drugą'},
        {'emoji': '⚙️', 'name': 'Maszyna', 'analogy': 'Każda część musi być dobrze naoliwiona'},
      ],
    },
    {
      'problem': 'Jak rozwiązać konflikt w zespole?',
      'cards': [
        {'emoji': '🌉', 'name': 'Most', 'analogy': 'Połącz dwa brzegi, stwórz przejście między stronami'},
        {'emoji': '🧩', 'name': 'Puzzle', 'analogy': 'Znajdź jak kawałki do siebie pasują'},
        {'emoji': '🎭', 'name': 'Teatr', 'analogy': 'Czasem trzeba odegrać role by zrozumieć drugą stronę'},
        {'emoji': '⚖️', 'name': 'Waga', 'analogy': 'Znajdź równowagę, nie musi być 50/50'},
        {'emoji': '🌈', 'name': 'Tęcza', 'analogy': 'Z różnych barw powstaje piękno'},
        {'emoji': '🔧', 'name': 'Narzędzie', 'analogy': 'Użyj odpowiedniego narzędzia do każdego problemu'},
      ],
    },
  ];

  int _currentProblemIndex = 0;
  String? _selectedCard;
  final Map<String, String> _savedAnalogies = {};
  bool _showExplanation = true;

  @override
  Widget build(BuildContext context) {
    final currentProblem = _problems[_currentProblemIndex];
    final cards = currentProblem['cards'] as List<Map<String, dynamic>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analogie'),
        backgroundColor: const Color(0xFFEF4444),
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
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_showExplanation)
                Card(
                  color: const Color(0xFFEF4444).withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.compare_arrows, color: Color(0xFFEF4444)),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text('Jak to działa?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Myślenie analogiczne to przenoszenie rozwiązań z jednej dziedziny do drugiej. Kliknij kartę, aby zobaczyć analogię!',
                          style: TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              Text(
                'Problem ${_currentProblemIndex + 1}/${_problems.length}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFFEF4444), Color(0xFFF59E0B)]),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: const Color(0xFFEF4444).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.lightbulb, size: 40, color: Colors.white),
                    const SizedBox(height: 12),
                    Text(
                      currentProblem['problem'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Kliknij kartę, aby zobaczyć analogię:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  final card = cards[index];
                  final isSelected = _selectedCard == card['name'];
                  return _buildAnalogyCard(card, isSelected);
                },
              ),
              if (_selectedCard != null) ...[
                const SizedBox(height: 24),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.lightbulb, size: 40, color: Color(0xFF10B981)),
                          const SizedBox(height: 12),
                          Text(
                            _savedAnalogies[_selectedCard] ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              if (_currentProblemIndex < _problems.length - 1)
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentProblemIndex++;
                      _selectedCard = null;
                      _savedAnalogies.clear();
                    });
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Następny problem'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                )
              else
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentProblemIndex = 0;
                      _selectedCard = null;
                      _savedAnalogies.clear();
                    });
                  },
                  icon: const Icon(Icons.replay),
                  label: const Text('Zacznij od nowa'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF4444),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalogyCard(Map<String, dynamic> card, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCard = card['name'];
          _savedAnalogies[card['name']] = card['analogy'];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEF4444) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? const Color(0xFFEF4444) : Colors.grey[300]!, width: isSelected ? 3 : 1.5),
          boxShadow: isSelected ? [BoxShadow(color: const Color(0xFFEF4444).withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))] : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(card['emoji'], style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 8),
            Text(
              card['name'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: isSelected ? Colors.white : Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
