import 'package:flutter/material.dart';

class ReversalGame extends StatefulWidget {
  const ReversalGame({super.key});

  @override
  State<ReversalGame> createState() => _ReversalGameState();
}

class _ReversalGameState extends State<ReversalGame> {
  final List<Map<String, String>> _problems = [
    {
      'problem': 'Jak zwiększyć sprzedaż produktu?',
      'reversal': 'Jak zmniejszyć sprzedaż produktu?',
      'insight': 'Myśląc o zmniejszeniu sprzedaży, odkrywasz bariery: złe opinie, wysoka cena, słaba dostępność. Ich odwrócenie daje rozwiązania!',
    },
    {
      'problem': 'Jak przyspieszyć pracę zespołu?',
      'reversal': 'Jak spowolnić pracę zespołu?',
      'insight': 'Czynniki spowalniające: zbyt wiele spotkań, chaos w komunikacji, brak priorytetów. Wyeliminuj je!',
    },
    {
      'problem': 'Jak przyciągnąć więcej klientów?',
      'reversal': 'Jak odstraszyć klientów?',
      'insight': 'Odstraszające czynniki: brak obsługi klienta, niejasna oferta, trudna nawigacja. Popraw je!',
    },
    {
      'problem': 'Jak poprawić jakość produktu?',
      'reversal': 'Jak pogorszyć jakość produktu?',
      'insight': 'Złe materiały, brak testów, ignorowanie feedbacku - odwróć te działania!',
    },
  ];

  int _currentIndex = 0;
  bool _showReversal = false;
  bool _showInsight = false;
  bool _showExplanation = true;

  void _nextProblem() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _problems.length;
      _showReversal = false;
      _showInsight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = _problems[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Odwróć Problem'),
        backgroundColor: const Color(0xFF8B5CF6),
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
                    color: const Color(0xFF8B5CF6).withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.flip, color: Color(0xFF8B5CF6)),
                              const SizedBox(width: 8),
                              const Text('Jak to działa?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Technika Odwrócenia polega na odwróceniu problemu na głowę. Zamiast pytać "jak coś poprawić", pytamy "jak to pogorszyć". To pozwala zobaczyć ukryte przeszkody i bariery.',
                            style: TextStyle(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                Text(
                  'Problem ${_currentIndex + 1}/${_problems.length}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [const Color(0xFF8B5CF6), const Color(0xFF8B5CF6).withOpacity(0.8)]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: const Color(0xFF8B5CF6).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.help_outline, size: 50, color: Colors.white),
                      const SizedBox(height: 16),
                      Text(
                        current['problem']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _showReversal = true;
                    });
                  },
                  icon: const Icon(Icons.flip),
                  label: const Text('Odwróć problem'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5CF6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                if (_showReversal) ...[
                  const SizedBox(height: 24),
                  AnimatedOpacity(
                    opacity: _showReversal ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEC4899).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFEC4899), width: 2),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.rotate_left, size: 40, color: Color(0xFFEC4899)),
                          const SizedBox(height: 12),
                          const Text('Odwrócony problem:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(
                            current['reversal']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFEC4899)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _showInsight = true;
                      });
                    },
                    icon: const Icon(Icons.tips_and_updates),
                    label: const Text('Pokaż insight'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC4899),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
                if (_showInsight) ...[
                  const SizedBox(height: 24),
                  AnimatedOpacity(
                    opacity: _showInsight ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Card(
                      color: const Color(0xFF06B6D4).withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Icon(Icons.lightbulb, size: 40, color: Color(0xFF06B6D4)),
                            const SizedBox(height: 12),
                            const Text('Co z tego wynika?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 12),
                            Text(current['insight']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, height: 1.5)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _nextProblem,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Następny problem'),
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
