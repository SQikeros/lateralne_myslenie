import 'package:flutter/material.dart';

class AboutAuthorTab extends StatelessWidget {
  const AboutAuthorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [const Color(0xFF6366F1).withOpacity(0.1), Colors.white]),
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)]),
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: const Color(0xFF6366F1).withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10))],
                  ),
                  child: const Center(
                    child: Text(
                      'GP',
                      style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Grzesiek', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: const Color(0xFF6366F1).withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 16, color: Color(0xFF6366F1), fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 32),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person_outline, color: Color(0xFF6366F1), size: 28),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text('O mnie', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Siemanko! Od dłuższego czasu tworzę aplikacje we Flutterze i rozwijam się we wszystkim, co mogę. Często programuję, więc stworzyłem tę aplikację, bo nie wiedziałem, co innego mógłbym zrobić.',
                          style: TextStyle(fontSize: 15, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.school, color: Color(0xFF8B5CF6), size: 28),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text('O projekcie', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Ta aplikacja to mój projekt zaliczeniowy z warsztatów "Techniki Myślenia Lateralnego". '
                          'Postanowiłem połączyć moją pasję do programowania z tematyką kreatywności, tworząc interaktywne narzędzie do nauki.',
                          style: TextStyle(fontSize: 15, height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFF8B5CF6).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('🗓️ Data prezentacji:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('10 stycznia 2026', style: TextStyle(fontSize: 14)),
                              SizedBox(height: 12),
                              Text('🎓 Kurs:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Techniki Myślenia Lateralnego (20h)', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.code, color: Color(0xFFEC4899), size: 28),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text('Technologie', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildTechChip('Flutter', Icons.flutter_dash, const Color(0xFF02569B)),
                        const SizedBox(height: 8),
                        _buildTechChip('Dart', Icons.code, const Color(0xFF0175C2)),
                        const SizedBox(height: 8),
                        _buildTechChip('Material Design 3', Icons.palette, const Color(0xFF6366F1)),
                        const SizedBox(height: 8),
                        _buildTechChip('Animacje', Icons.animation, const Color(0xFF8B5CF6)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.lightbulb, color: Color(0xFF06B6D4), size: 28),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text('Moja definicja kreatywności', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [const Color(0xFF06B6D4).withOpacity(0.1), const Color(0xFF06B6D4).withOpacity(0.05)]),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF06B6D4).withOpacity(0.3), width: 2),
                          ),
                          child: const Text(
                            '"Kreatywność to mieszanie losowych pomysłów i patrzenie co się stanie. '
                            'Nie musisz być geniuszem. Musisz próbować! 😊"',
                            style: TextStyle(fontSize: 16, height: 1.6, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('🚀 Dziękuję za uwagę!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTechChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
