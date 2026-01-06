import 'package:flutter/material.dart';

class ScamperGame extends StatefulWidget {
  const ScamperGame({super.key});

  @override
  State<ScamperGame> createState() => _ScamperGameState();
}

class _ScamperGameState extends State<ScamperGame> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _scamperQuestions = [
    {
      'letter': 'S',
      'title': 'Substitute',
      'subtitle': 'Zastąp',
      'question': 'Co możesz zastąpić lub wymienić?',
      'prompts': ['Jakie materiały możesz zmienić?', 'Kto inny mógłby to zrobić?', 'Co jeszcze mogłoby pełnić tę funkcję?'],
      'example': 'Przykład: Plastikowe słomki → bambusowe słomki',
      'color': Color(0xFFEF4444),
    },
    {
      'letter': 'C',
      'title': 'Combine',
      'subtitle': 'Połącz',
      'question': 'Co możesz połączyć lub zintegrować?',
      'prompts': ['Jakie funkcje możesz scalić?', 'Co możesz dodać do istniejącego produktu?', 'Jak połączyć dwie rzeczy w jedną?'],
      'example': 'Przykład: Telefon + aparat + internet = smartphone',
      'color': Color(0xFFF59E0B),
    },
    {
      'letter': 'A',
      'title': 'Adapt',
      'subtitle': 'Adaptuj',
      'question': 'Co możesz zaadaptować z innych dziedzin?',
      'prompts': ['Co podobnego istnieje gdzie indziej?', 'Jakie rozwiązania można przenieść?', 'Czego możesz się nauczyć z natury?'],
      'example': 'Przykład: Rzepy roślin → rzepy tekstylne',
      'color': Color(0xFFFBBF24),
    },
    {
      'letter': 'M',
      'title': 'Modify',
      'subtitle': 'Modyfikuj',
      'question': 'Co możesz zmodyfikować lub zmienić?',
      'prompts': ['Zmień kształt, rozmiar, kolor?', 'Co możesz powiększyć lub pomniejszyć?', 'Jak zmienić właściwości?'],
      'example': 'Przykład: Zegarek → smartwatch',
      'color': Color(0xFF10B981),
    },
    {
      'letter': 'P',
      'title': 'Put to other use',
      'subtitle': 'Inne zastosowanie',
      'question': 'Jak inaczej można to wykorzystać?',
      'prompts': ['W jakiej innej sytuacji to się przydaje?', 'Kto jeszcze mógłby z tego skorzystać?', 'Jakie nieoczywiste zastosowania?'],
      'example': 'Przykład: Stare opony → huśtawki, donice',
      'color': Color(0xFF3B82F6),
    },
    {
      'letter': 'E',
      'title': 'Eliminate',
      'subtitle': 'Wyeliminuj',
      'question': 'Co możesz usunąć lub uprościć?',
      'prompts': ['Bez czego można się obejść?', 'Co jest niepotrzebne?', 'Jak uprościć proces?'],
      'example': 'Przykład: Bezprzewodowe słuchawki (bez kabla)',
      'color': Color(0xFF8B5CF6),
    },
    {
      'letter': 'R',
      'title': 'Reverse/Rearrange',
      'subtitle': 'Odwróć/Przestaw',
      'question': 'Co możesz odwrócić lub przestawić?',
      'prompts': ['Co by było gdyby zrobić na odwrót?', 'Zmienić kolejność kroków?', 'Odwrócić role użytkowników?'],
      'example': 'Przykład: Odwrócony parasol (łapie wodę)',
      'color': Color(0xFFEC4899),
    },
  ];

  final Map<int, String> _answers = {};
  bool _showExplanation = true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCAMPER Challenge'),
        backgroundColor: const Color(0xFFF59E0B),
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
      body: Column(
        children: [
          if (_showExplanation)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFF59E0B).withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.auto_awesome, color: Color(0xFFF59E0B)),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text('Swipe w lewo/prawo!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('SCAMPER to 7 pytań pomagających wymyślić innowacje. Przejdź przez wszystkie!', style: TextStyle(fontSize: 13, height: 1.4)),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == _currentPage ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(color: index == _currentPage ? const Color(0xFFF59E0B) : Colors.grey[300], borderRadius: BorderRadius.circular(4)),
                );
              }),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _scamperQuestions.length,
              itemBuilder: (context, index) {
                return _buildQuestionCard(_scamperQuestions[index], index);
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  if (_currentPage > 0)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Poprzedni'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  if (_currentPage > 0) const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _currentPage < 6
                          ? () {
                              _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                            }
                          : () {
                              _showSummary();
                            },
                      icon: Icon(_currentPage < 6 ? Icons.arrow_forward : Icons.check),
                      label: Text(_currentPage < 6 ? 'Następny' : 'Zakończ'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF59E0B),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(Map<String, dynamic> question, int index) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [question['color'], question['color'].withOpacity(0.7)]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: question['color'].withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
            ),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      question['letter'],
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  question['title'],
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(question['subtitle'], style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.9))),
                const SizedBox(height: 16),
                Text(
                  question['question'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Podpowiedzi:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...((question['prompts'] as List<String>).map((prompt) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(color: question['color'], shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(prompt, style: const TextStyle(fontSize: 15, height: 1.5))),
                ],
              ),
            );
          })),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: question['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: question['color'].withOpacity(0.3), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.tips_and_updates, color: question['color'], size: 20),
                    const SizedBox(width: 8),
                    const Text('Przykład:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(question['example'], style: const TextStyle(fontSize: 14, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Wpisz swój pomysł...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: question['color']),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: question['color'], width: 2),
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
            onChanged: (value) {
              _answers[index] = value;
            },
            controller: TextEditingController(text: _answers[index] ?? '')..selection = TextSelection.collapsed(offset: (_answers[index] ?? '').length),
          ),
        ],
      ),
    );
  }

  void _showSummary() {
    final completedCount = _answers.values.where((v) => v.isNotEmpty).length;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.celebration, color: Color(0xFFF59E0B), size: 32),
            const SizedBox(width: 12),
            const Expanded(child: Text('Gratulacje!', style: TextStyle(fontSize: 24))),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ukończyłeś SCAMPER Challenge!', style: const TextStyle(fontSize: 16, height: 1.5)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFF59E0B).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Wypełnione odpowiedzi:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '$completedCount/7',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF59E0B)),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentPage = 0;
                _answers.clear();
              });
              _pageController.jumpToPage(0);
            },
            child: const Text('Zacznij od nowa'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF59E0B), foregroundColor: Colors.white),
            child: const Text('Zamknij'),
          ),
        ],
      ),
    );
  }
}
