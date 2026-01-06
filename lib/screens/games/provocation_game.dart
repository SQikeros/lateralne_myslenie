import 'package:flutter/material.dart';

class ProvocationGame extends StatefulWidget {
  const ProvocationGame({super.key});

  @override
  State<ProvocationGame> createState() => _ProvocationGameState();
}

class _ProvocationGameState extends State<ProvocationGame> {
  final List<Map<String, dynamic>> _provocations = [
    {
      'statement': 'Samochody powinny jeździć do tyłu',
      'questions': ['Czy to zmniejszyłoby wypadki?', 'Jak wyglądałyby drogi?', 'Czy kierowcy byliby bardziej ostrożni?'],
      'insight':
          'To prowokacyjne stwierdzenie zmusza do przemyślenia bezpieczeństwa, widoczności i uwagi kierowców. Prowadzi do pomysłów jak kamery cofania, lepsze lusterka, systemy wykrywania przeszkód.',
    },
    {
      'statement': 'Pracownicy powinni płacić pracodawcy',
      'questions': ['Co by się zmieniło w relacji pracodawca-pracownik?', 'Czy ludzie bardziej ceniliby swoją pracę?', 'Jak wyglądałoby zatrudnienie?'],
      'insight':
          'Ta prowokacja kwestionuje tradycyjny model zatrudnienia. Prowadzi do myślenia o wartości pracy, benefitach, rozwoju kompetencji i systemach opartych na partnerstwie.',
    },
    {
      'statement': 'Restauracje bez jedzenia',
      'questions': ['Co ludzie wtedy byliby w restauracji robić?', 'Jaka byłaby wartość takiego miejsca?', 'Jak wyglądałby biznes model?'],
      'insight':
          'Prowokacja pokazuje, że restauracje to nie tylko jedzenie - to atmosfera, spotkania, doświadczenie. Prowadzi do konceptów jak przestrzenie coworkingowe z kuchnią, kluby dyskusyjne, miejsca networkingowe.',
    },
  ];

  int _currentIndex = 0;
  int _selectedAnswer = -1;
  bool _showInsight = false;
  bool _showExplanation = true;

  void _nextProvocation() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _provocations.length;
      _selectedAnswer = -1;
      _showInsight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = _provocations[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prowokacja'),
        backgroundColor: const Color(0xFF06B6D4),
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
                    color: const Color(0xFF06B6D4).withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.emoji_objects, color: Color(0xFF06B6D4)),
                              const SizedBox(width: 8),
                              const Text('Jak to działa?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Technika Prowokacji (PO - Provocative Operation) polega na celowym stworzeniu absurdalnego lub niemożliwego stwierdzenia. To zmusza mózg do kwestionowania założeń i odkrywania nowych ścieżek myślenia.',
                            style: TextStyle(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                Text(
                  'Prowokacja ${_currentIndex + 1}/${_provocations.length}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [const Color(0xFF06B6D4), const Color(0xFF06B6D4).withOpacity(0.7)]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: const Color(0xFF06B6D4).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.warning_amber_rounded, size: 50, color: Colors.white),
                      const SizedBox(height: 16),
                      const Text(
                        'PO:',
                        style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        current['statement'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Zadaj sobie pytania:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ...(current['questions'] as List<String>).asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedAnswer = entry.key;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _selectedAnswer == entry.key ? const Color(0xFF06B6D4).withOpacity(0.15) : Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _selectedAnswer == entry.key ? const Color(0xFF06B6D4) : Colors.grey[300]!, width: 2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: _selectedAnswer == entry.key ? const Color(0xFF06B6D4) : Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${entry.key + 1}',
                                  style: TextStyle(color: _selectedAnswer == entry.key ? Colors.white : Colors.grey[700], fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(fontSize: 16, fontWeight: _selectedAnswer == entry.key ? FontWeight.bold : FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _selectedAnswer >= 0
                      ? () {
                          setState(() {
                            _showInsight = true;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.lightbulb),
                  label: const Text('Pokaż insight'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06B6D4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                ),
                if (_showInsight) ...[
                  const SizedBox(height: 24),
                  AnimatedOpacity(
                    opacity: _showInsight ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Card(
                      color: const Color(0xFFEC4899).withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Icon(Icons.insights, size: 40, color: Color(0xFFEC4899)),
                            const SizedBox(height: 12),
                            const Text('Co z tego wynika?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 12),
                            Text(current['insight'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, height: 1.5)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _nextProvocation,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Następna prowokacja'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
