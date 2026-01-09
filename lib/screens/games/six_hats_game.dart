import 'package:flutter/material.dart';
import 'dart:async';

class SixHatsGame extends StatefulWidget {
  const SixHatsGame({super.key});

  @override
  State<SixHatsGame> createState() => _SixHatsGameState();
}

class _SixHatsGameState extends State<SixHatsGame> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _hats = [
    {
      'name': 'Biały Kapelusz',
      'emoji': '🤍',
      'color': Colors.grey[300]!,
      'textColor': Colors.black87,
      'role': 'Fakty i dane',
      'questions': ['Jakie fakty są nam znane?', 'Jakich informacji nam brakuje?', 'Jak możemy zdobyć brakujące dane?'],
      'description': 'Neutralny, obiektywny. Focus na faktach i liczbach.',
    },
    {
      'name': 'Czerwony Kapelusz',
      'emoji': '❤️',
      'color': Color(0xFFEF4444),
      'textColor': Colors.white,
      'role': 'Emocje i intuicja',
      'questions': ['Co czuję w tej sprawie?', 'Jaka jest moja pierwsza intuicja?', 'Co mówi mi instynkt?'],
      'description': 'Emocjonalny. Wyrażaj uczucia bez uzasadnienia.',
    },
    {
      'name': 'Czarny Kapelusz',
      'emoji': '🖤',
      'color': Colors.black87,
      'textColor': Colors.white,
      'role': 'Ryzyka i zagrożenia',
      'questions': ['Co może pójść nie tak?', 'Jakie są ryzyka?', 'Dlaczego to może nie zadziałać?'],
      'description': 'Krytyczny, pesymistyczny. Ostrzegaj przed problemami.',
    },
    {
      'name': 'Żółty Kapelusz',
      'emoji': '💛',
      'color': Color(0xFFFBBF24),
      'textColor': Colors.black87,
      'role': 'Korzyści i szanse',
      'questions': ['Jakie są korzyści?', 'Co może się udać?', 'Jak to nam pomoże?'],
      'description': 'Optymistyczny. Szukaj wartości i pozytywów.',
    },
    {
      'name': 'Zielony Kapelusz',
      'emoji': '💚',
      'color': Color(0xFF10B981),
      'textColor': Colors.white,
      'role': 'Kreatywność i pomysły',
      'questions': ['Jakie są alternatywy?', 'Co nowego możemy spróbować?', 'Jak to zrobić inaczej?'],
      'description': 'Kreatywny. Generuj nowe pomysły i rozwiązania.',
    },
    {
      'name': 'Niebieski Kapelusz',
      'emoji': '💙',
      'color': Color(0xFF3B82F6),
      'textColor': Colors.white,
      'role': 'Zarządzanie procesem',
      'questions': ['Gdzie jesteśmy teraz?', 'Co już omówiliśmy?', 'Jaki jest następny krok?'],
      'description': 'Moderator. Kontroluj proces myślenia.',
    },
  ];

  int? _selectedHatIndex;
  Timer? _timer;
  int _secondsLeft = 60;
  bool _isTimerRunning = false;
  final Map<int, String> _notes = {};
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this)..repeat(reverse: true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isTimerRunning = true;
      _secondsLeft = 60;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isTimerRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Six Thinking Hats'), backgroundColor: const Color(0xFF10B981), foregroundColor: Colors.white),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: const Color(0xFF10B981).withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.psychology, color: Color(0xFF10B981)),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text('6 Kapeluszy Myślenia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Metoda Edwarda de Bono. Każdy kapelusz to inna perspektywa myślenia. Wybierz kapelusz i zobacz pytania!',
                        style: TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Wybierz kapelusz:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _hats.length,
                itemBuilder: (context, index) {
                  return _buildHatCard(_hats[index], index);
                },
              ),
              if (_selectedHatIndex != null) ...[const SizedBox(height: 32), _buildSelectedHatDetails()],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHatCard(Map<String, dynamic> hat, int index) {
    final isSelected = _selectedHatIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedHatIndex = index;
          _stopTimer();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ? hat['color'] : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: hat['color'], width: isSelected ? 3 : 1.5),
          boxShadow: isSelected ? [BoxShadow(color: hat['color'].withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 8))] : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hat['emoji'], style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                hat['name'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isSelected ? hat['textColor'] : Colors.black87),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                hat['role'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: isSelected ? hat['textColor'].withOpacity(0.8) : Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedHatDetails() {
    final hat = _hats[_selectedHatIndex!];

    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: hat['color'], borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Text(hat['emoji'], style: const TextStyle(fontSize: 60)),
                const SizedBox(height: 12),
                Text(
                  hat['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: hat['textColor']),
                ),
                const SizedBox(height: 8),
                Text(
                  hat['description'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: hat['textColor'].withOpacity(0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (_isTimerRunning)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _secondsLeft <= 10 ? Colors.red.withOpacity(0.1) : hat['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _secondsLeft <= 10 ? Colors.red : hat['color'], width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer, size: 32, color: _secondsLeft <= 10 ? Colors.red : hat['color']),
                  const SizedBox(width: 12),
                  Text(
                    '$_secondsLeft s',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: _secondsLeft <= 10 ? Colors.red : hat['color']),
                  ),
                ],
              ),
            )
          else
            ElevatedButton.icon(
              onPressed: _startTimer,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start Timer (60s)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: hat['color'],
                foregroundColor: hat['textColor'],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          const SizedBox(height: 20),
          const Text('Pytania do rozważenia:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...((hat['questions'] as List<String>).map((question) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.help_outline, color: hat['color'], size: 20),
                    const SizedBox(width: 12),
                    Expanded(child: Text(question, style: const TextStyle(fontSize: 15, height: 1.4))),
                  ],
                ),
              ),
            );
          })),
          const SizedBox(height: 16),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Zapisz swoje przemyślenia...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: hat['color']),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: hat['color'], width: 2),
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
            onChanged: (value) {
              _notes[_selectedHatIndex!] = value;
            },
            controller: TextEditingController(text: _notes[_selectedHatIndex!] ?? '')
              ..selection = TextSelection.collapsed(offset: (_notes[_selectedHatIndex!] ?? '').length),
          ),
        ],
      ),
    );
  }
}
